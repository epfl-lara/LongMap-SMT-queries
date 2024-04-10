; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111670 () Bool)

(assert start!111670)

(declare-fun b_free!30327 () Bool)

(declare-fun b_next!30327 () Bool)

(assert (=> start!111670 (= b_free!30327 (not b_next!30327))))

(declare-fun tp!106456 () Bool)

(declare-fun b_and!48813 () Bool)

(assert (=> start!111670 (= tp!106456 b_and!48813)))

(declare-fun mapNonEmpty!55868 () Bool)

(declare-fun mapRes!55868 () Bool)

(declare-fun tp!106457 () Bool)

(declare-fun e!754292 () Bool)

(assert (=> mapNonEmpty!55868 (= mapRes!55868 (and tp!106457 e!754292))))

(declare-fun mapKey!55868 () (_ BitVec 32))

(declare-datatypes ((V!53299 0))(
  ( (V!53300 (val!18148 Int)) )
))
(declare-datatypes ((ValueCell!17175 0))(
  ( (ValueCellFull!17175 (v!20778 V!53299)) (EmptyCell!17175) )
))
(declare-datatypes ((array!89214 0))(
  ( (array!89215 (arr!43081 (Array (_ BitVec 32) ValueCell!17175)) (size!43631 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89214)

(declare-fun mapRest!55868 () (Array (_ BitVec 32) ValueCell!17175))

(declare-fun mapValue!55868 () ValueCell!17175)

(assert (=> mapNonEmpty!55868 (= (arr!43081 _values!1337) (store mapRest!55868 mapKey!55868 mapValue!55868))))

(declare-fun b!1322940 () Bool)

(declare-fun res!878108 () Bool)

(declare-fun e!754294 () Bool)

(assert (=> b!1322940 (=> (not res!878108) (not e!754294))))

(declare-datatypes ((array!89216 0))(
  ( (array!89217 (arr!43082 (Array (_ BitVec 32) (_ BitVec 64))) (size!43632 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89216)

(declare-datatypes ((List!30531 0))(
  ( (Nil!30528) (Cons!30527 (h!31736 (_ BitVec 64)) (t!44407 List!30531)) )
))
(declare-fun arrayNoDuplicates!0 (array!89216 (_ BitVec 32) List!30531) Bool)

(assert (=> b!1322940 (= res!878108 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30528))))

(declare-fun b!1322941 () Bool)

(declare-fun e!754291 () Bool)

(declare-fun e!754293 () Bool)

(assert (=> b!1322941 (= e!754291 (and e!754293 mapRes!55868))))

(declare-fun condMapEmpty!55868 () Bool)

(declare-fun mapDefault!55868 () ValueCell!17175)

(assert (=> b!1322941 (= condMapEmpty!55868 (= (arr!43081 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17175)) mapDefault!55868)))))

(declare-fun b!1322942 () Bool)

(declare-fun res!878106 () Bool)

(assert (=> b!1322942 (=> (not res!878106) (not e!754294))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53299)

(declare-fun minValue!1279 () V!53299)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((tuple2!23390 0))(
  ( (tuple2!23391 (_1!11706 (_ BitVec 64)) (_2!11706 V!53299)) )
))
(declare-datatypes ((List!30532 0))(
  ( (Nil!30529) (Cons!30528 (h!31737 tuple2!23390) (t!44408 List!30532)) )
))
(declare-datatypes ((ListLongMap!21047 0))(
  ( (ListLongMap!21048 (toList!10539 List!30532)) )
))
(declare-fun contains!8694 (ListLongMap!21047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5536 (array!89216 array!89214 (_ BitVec 32) (_ BitVec 32) V!53299 V!53299 (_ BitVec 32) Int) ListLongMap!21047)

(assert (=> b!1322942 (= res!878106 (contains!8694 (getCurrentListMap!5536 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322943 () Bool)

(declare-fun res!878105 () Bool)

(assert (=> b!1322943 (=> (not res!878105) (not e!754294))))

(assert (=> b!1322943 (= res!878105 (and (= (size!43631 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43632 _keys!1609) (size!43631 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55868 () Bool)

(assert (=> mapIsEmpty!55868 mapRes!55868))

(declare-fun res!878103 () Bool)

(assert (=> start!111670 (=> (not res!878103) (not e!754294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111670 (= res!878103 (validMask!0 mask!2019))))

(assert (=> start!111670 e!754294))

(declare-fun array_inv!32527 (array!89216) Bool)

(assert (=> start!111670 (array_inv!32527 _keys!1609)))

(assert (=> start!111670 true))

(declare-fun tp_is_empty!36147 () Bool)

(assert (=> start!111670 tp_is_empty!36147))

(declare-fun array_inv!32528 (array!89214) Bool)

(assert (=> start!111670 (and (array_inv!32528 _values!1337) e!754291)))

(assert (=> start!111670 tp!106456))

(declare-fun b!1322944 () Bool)

(declare-fun res!878107 () Bool)

(assert (=> b!1322944 (=> (not res!878107) (not e!754294))))

(assert (=> b!1322944 (= res!878107 (not (= (select (arr!43082 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322945 () Bool)

(assert (=> b!1322945 (= e!754294 (not true))))

(declare-fun lt!588572 () ListLongMap!21047)

(declare-fun +!4591 (ListLongMap!21047 tuple2!23390) ListLongMap!21047)

(assert (=> b!1322945 (contains!8694 (+!4591 lt!588572 (tuple2!23391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43602 0))(
  ( (Unit!43603) )
))
(declare-fun lt!588566 () Unit!43602)

(declare-fun addStillContains!1140 (ListLongMap!21047 (_ BitVec 64) V!53299 (_ BitVec 64)) Unit!43602)

(assert (=> b!1322945 (= lt!588566 (addStillContains!1140 lt!588572 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1322945 (contains!8694 lt!588572 k0!1164)))

(declare-fun lt!588565 () ListLongMap!21047)

(declare-fun lt!588569 () tuple2!23390)

(assert (=> b!1322945 (= lt!588572 (+!4591 lt!588565 lt!588569))))

(declare-fun lt!588573 () Unit!43602)

(assert (=> b!1322945 (= lt!588573 (addStillContains!1140 lt!588565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322945 (contains!8694 lt!588565 k0!1164)))

(declare-fun lt!588563 () V!53299)

(declare-fun lt!588570 () Unit!43602)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!187 ((_ BitVec 64) (_ BitVec 64) V!53299 ListLongMap!21047) Unit!43602)

(assert (=> b!1322945 (= lt!588570 (lemmaInListMapAfterAddingDiffThenInBefore!187 k0!1164 (select (arr!43082 _keys!1609) from!2000) lt!588563 lt!588565))))

(declare-fun lt!588567 () ListLongMap!21047)

(assert (=> b!1322945 (contains!8694 lt!588567 k0!1164)))

(declare-fun lt!588568 () Unit!43602)

(assert (=> b!1322945 (= lt!588568 (lemmaInListMapAfterAddingDiffThenInBefore!187 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588567))))

(declare-fun lt!588564 () ListLongMap!21047)

(assert (=> b!1322945 (contains!8694 lt!588564 k0!1164)))

(declare-fun lt!588571 () Unit!43602)

(assert (=> b!1322945 (= lt!588571 (lemmaInListMapAfterAddingDiffThenInBefore!187 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588564))))

(assert (=> b!1322945 (= lt!588564 (+!4591 lt!588567 lt!588569))))

(assert (=> b!1322945 (= lt!588569 (tuple2!23391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322945 (= lt!588567 (+!4591 lt!588565 (tuple2!23391 (select (arr!43082 _keys!1609) from!2000) lt!588563)))))

(declare-fun get!21691 (ValueCell!17175 V!53299) V!53299)

(declare-fun dynLambda!3530 (Int (_ BitVec 64)) V!53299)

(assert (=> b!1322945 (= lt!588563 (get!21691 (select (arr!43081 _values!1337) from!2000) (dynLambda!3530 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6226 (array!89216 array!89214 (_ BitVec 32) (_ BitVec 32) V!53299 V!53299 (_ BitVec 32) Int) ListLongMap!21047)

(assert (=> b!1322945 (= lt!588565 (getCurrentListMapNoExtraKeys!6226 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322946 () Bool)

(assert (=> b!1322946 (= e!754293 tp_is_empty!36147)))

(declare-fun b!1322947 () Bool)

(assert (=> b!1322947 (= e!754292 tp_is_empty!36147)))

(declare-fun b!1322948 () Bool)

(declare-fun res!878104 () Bool)

(assert (=> b!1322948 (=> (not res!878104) (not e!754294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89216 (_ BitVec 32)) Bool)

(assert (=> b!1322948 (= res!878104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322949 () Bool)

(declare-fun res!878102 () Bool)

(assert (=> b!1322949 (=> (not res!878102) (not e!754294))))

(assert (=> b!1322949 (= res!878102 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43632 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322950 () Bool)

(declare-fun res!878101 () Bool)

(assert (=> b!1322950 (=> (not res!878101) (not e!754294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322950 (= res!878101 (validKeyInArray!0 (select (arr!43082 _keys!1609) from!2000)))))

(assert (= (and start!111670 res!878103) b!1322943))

(assert (= (and b!1322943 res!878105) b!1322948))

(assert (= (and b!1322948 res!878104) b!1322940))

(assert (= (and b!1322940 res!878108) b!1322949))

(assert (= (and b!1322949 res!878102) b!1322942))

(assert (= (and b!1322942 res!878106) b!1322944))

(assert (= (and b!1322944 res!878107) b!1322950))

(assert (= (and b!1322950 res!878101) b!1322945))

(assert (= (and b!1322941 condMapEmpty!55868) mapIsEmpty!55868))

(assert (= (and b!1322941 (not condMapEmpty!55868)) mapNonEmpty!55868))

(get-info :version)

(assert (= (and mapNonEmpty!55868 ((_ is ValueCellFull!17175) mapValue!55868)) b!1322947))

(assert (= (and b!1322941 ((_ is ValueCellFull!17175) mapDefault!55868)) b!1322946))

(assert (= start!111670 b!1322941))

(declare-fun b_lambda!23653 () Bool)

(assert (=> (not b_lambda!23653) (not b!1322945)))

(declare-fun t!44406 () Bool)

(declare-fun tb!11679 () Bool)

(assert (=> (and start!111670 (= defaultEntry!1340 defaultEntry!1340) t!44406) tb!11679))

(declare-fun result!24413 () Bool)

(assert (=> tb!11679 (= result!24413 tp_is_empty!36147)))

(assert (=> b!1322945 t!44406))

(declare-fun b_and!48815 () Bool)

(assert (= b_and!48813 (and (=> t!44406 result!24413) b_and!48815)))

(declare-fun m!1211447 () Bool)

(assert (=> start!111670 m!1211447))

(declare-fun m!1211449 () Bool)

(assert (=> start!111670 m!1211449))

(declare-fun m!1211451 () Bool)

(assert (=> start!111670 m!1211451))

(declare-fun m!1211453 () Bool)

(assert (=> b!1322950 m!1211453))

(assert (=> b!1322950 m!1211453))

(declare-fun m!1211455 () Bool)

(assert (=> b!1322950 m!1211455))

(declare-fun m!1211457 () Bool)

(assert (=> b!1322940 m!1211457))

(assert (=> b!1322944 m!1211453))

(declare-fun m!1211459 () Bool)

(assert (=> b!1322948 m!1211459))

(declare-fun m!1211461 () Bool)

(assert (=> b!1322942 m!1211461))

(assert (=> b!1322942 m!1211461))

(declare-fun m!1211463 () Bool)

(assert (=> b!1322942 m!1211463))

(declare-fun m!1211465 () Bool)

(assert (=> b!1322945 m!1211465))

(declare-fun m!1211467 () Bool)

(assert (=> b!1322945 m!1211467))

(assert (=> b!1322945 m!1211453))

(declare-fun m!1211469 () Bool)

(assert (=> b!1322945 m!1211469))

(declare-fun m!1211471 () Bool)

(assert (=> b!1322945 m!1211471))

(declare-fun m!1211473 () Bool)

(assert (=> b!1322945 m!1211473))

(declare-fun m!1211475 () Bool)

(assert (=> b!1322945 m!1211475))

(declare-fun m!1211477 () Bool)

(assert (=> b!1322945 m!1211477))

(declare-fun m!1211479 () Bool)

(assert (=> b!1322945 m!1211479))

(declare-fun m!1211481 () Bool)

(assert (=> b!1322945 m!1211481))

(declare-fun m!1211483 () Bool)

(assert (=> b!1322945 m!1211483))

(declare-fun m!1211485 () Bool)

(assert (=> b!1322945 m!1211485))

(assert (=> b!1322945 m!1211453))

(declare-fun m!1211487 () Bool)

(assert (=> b!1322945 m!1211487))

(declare-fun m!1211489 () Bool)

(assert (=> b!1322945 m!1211489))

(assert (=> b!1322945 m!1211473))

(declare-fun m!1211491 () Bool)

(assert (=> b!1322945 m!1211491))

(declare-fun m!1211493 () Bool)

(assert (=> b!1322945 m!1211493))

(declare-fun m!1211495 () Bool)

(assert (=> b!1322945 m!1211495))

(declare-fun m!1211497 () Bool)

(assert (=> b!1322945 m!1211497))

(assert (=> b!1322945 m!1211481))

(assert (=> b!1322945 m!1211471))

(declare-fun m!1211499 () Bool)

(assert (=> b!1322945 m!1211499))

(declare-fun m!1211501 () Bool)

(assert (=> mapNonEmpty!55868 m!1211501))

(check-sat (not start!111670) (not b_lambda!23653) (not mapNonEmpty!55868) (not b!1322940) (not b_next!30327) (not b!1322942) (not b!1322950) (not b!1322948) (not b!1322945) b_and!48815 tp_is_empty!36147)
(check-sat b_and!48815 (not b_next!30327))
