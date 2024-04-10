; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111672 () Bool)

(assert start!111672)

(declare-fun b_free!30329 () Bool)

(declare-fun b_next!30329 () Bool)

(assert (=> start!111672 (= b_free!30329 (not b_next!30329))))

(declare-fun tp!106462 () Bool)

(declare-fun b_and!48817 () Bool)

(assert (=> start!111672 (= tp!106462 b_and!48817)))

(declare-fun b!1322975 () Bool)

(declare-fun e!754308 () Bool)

(assert (=> b!1322975 (= e!754308 (not true))))

(declare-datatypes ((V!53301 0))(
  ( (V!53302 (val!18149 Int)) )
))
(declare-datatypes ((tuple2!23392 0))(
  ( (tuple2!23393 (_1!11707 (_ BitVec 64)) (_2!11707 V!53301)) )
))
(declare-datatypes ((List!30533 0))(
  ( (Nil!30530) (Cons!30529 (h!31738 tuple2!23392) (t!44411 List!30533)) )
))
(declare-datatypes ((ListLongMap!21049 0))(
  ( (ListLongMap!21050 (toList!10540 List!30533)) )
))
(declare-fun lt!588598 () ListLongMap!21049)

(declare-fun minValue!1279 () V!53301)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8695 (ListLongMap!21049 (_ BitVec 64)) Bool)

(declare-fun +!4592 (ListLongMap!21049 tuple2!23392) ListLongMap!21049)

(assert (=> b!1322975 (contains!8695 (+!4592 lt!588598 (tuple2!23393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43604 0))(
  ( (Unit!43605) )
))
(declare-fun lt!588596 () Unit!43604)

(declare-fun addStillContains!1141 (ListLongMap!21049 (_ BitVec 64) V!53301 (_ BitVec 64)) Unit!43604)

(assert (=> b!1322975 (= lt!588596 (addStillContains!1141 lt!588598 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1322975 (contains!8695 lt!588598 k!1164)))

(declare-fun lt!588605 () ListLongMap!21049)

(declare-fun lt!588597 () tuple2!23392)

(assert (=> b!1322975 (= lt!588598 (+!4592 lt!588605 lt!588597))))

(declare-fun zeroValue!1279 () V!53301)

(declare-fun lt!588604 () Unit!43604)

(assert (=> b!1322975 (= lt!588604 (addStillContains!1141 lt!588605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322975 (contains!8695 lt!588605 k!1164)))

(declare-datatypes ((array!89218 0))(
  ( (array!89219 (arr!43083 (Array (_ BitVec 32) (_ BitVec 64))) (size!43633 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89218)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588599 () V!53301)

(declare-fun lt!588601 () Unit!43604)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!188 ((_ BitVec 64) (_ BitVec 64) V!53301 ListLongMap!21049) Unit!43604)

(assert (=> b!1322975 (= lt!588601 (lemmaInListMapAfterAddingDiffThenInBefore!188 k!1164 (select (arr!43083 _keys!1609) from!2000) lt!588599 lt!588605))))

(declare-fun lt!588600 () ListLongMap!21049)

(assert (=> b!1322975 (contains!8695 lt!588600 k!1164)))

(declare-fun lt!588606 () Unit!43604)

(assert (=> b!1322975 (= lt!588606 (lemmaInListMapAfterAddingDiffThenInBefore!188 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588600))))

(declare-fun lt!588602 () ListLongMap!21049)

(assert (=> b!1322975 (contains!8695 lt!588602 k!1164)))

(declare-fun lt!588603 () Unit!43604)

(assert (=> b!1322975 (= lt!588603 (lemmaInListMapAfterAddingDiffThenInBefore!188 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588602))))

(assert (=> b!1322975 (= lt!588602 (+!4592 lt!588600 lt!588597))))

(assert (=> b!1322975 (= lt!588597 (tuple2!23393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322975 (= lt!588600 (+!4592 lt!588605 (tuple2!23393 (select (arr!43083 _keys!1609) from!2000) lt!588599)))))

(declare-datatypes ((ValueCell!17176 0))(
  ( (ValueCellFull!17176 (v!20779 V!53301)) (EmptyCell!17176) )
))
(declare-datatypes ((array!89220 0))(
  ( (array!89221 (arr!43084 (Array (_ BitVec 32) ValueCell!17176)) (size!43634 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89220)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21692 (ValueCell!17176 V!53301) V!53301)

(declare-fun dynLambda!3531 (Int (_ BitVec 64)) V!53301)

(assert (=> b!1322975 (= lt!588599 (get!21692 (select (arr!43084 _values!1337) from!2000) (dynLambda!3531 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6227 (array!89218 array!89220 (_ BitVec 32) (_ BitVec 32) V!53301 V!53301 (_ BitVec 32) Int) ListLongMap!21049)

(assert (=> b!1322975 (= lt!588605 (getCurrentListMapNoExtraKeys!6227 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!878130 () Bool)

(assert (=> start!111672 (=> (not res!878130) (not e!754308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111672 (= res!878130 (validMask!0 mask!2019))))

(assert (=> start!111672 e!754308))

(declare-fun array_inv!32529 (array!89218) Bool)

(assert (=> start!111672 (array_inv!32529 _keys!1609)))

(assert (=> start!111672 true))

(declare-fun tp_is_empty!36149 () Bool)

(assert (=> start!111672 tp_is_empty!36149))

(declare-fun e!754306 () Bool)

(declare-fun array_inv!32530 (array!89220) Bool)

(assert (=> start!111672 (and (array_inv!32530 _values!1337) e!754306)))

(assert (=> start!111672 tp!106462))

(declare-fun b!1322976 () Bool)

(declare-fun res!878132 () Bool)

(assert (=> b!1322976 (=> (not res!878132) (not e!754308))))

(assert (=> b!1322976 (= res!878132 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43633 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322977 () Bool)

(declare-fun res!878129 () Bool)

(assert (=> b!1322977 (=> (not res!878129) (not e!754308))))

(declare-fun getCurrentListMap!5537 (array!89218 array!89220 (_ BitVec 32) (_ BitVec 32) V!53301 V!53301 (_ BitVec 32) Int) ListLongMap!21049)

(assert (=> b!1322977 (= res!878129 (contains!8695 (getCurrentListMap!5537 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322978 () Bool)

(declare-fun res!878126 () Bool)

(assert (=> b!1322978 (=> (not res!878126) (not e!754308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89218 (_ BitVec 32)) Bool)

(assert (=> b!1322978 (= res!878126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322979 () Bool)

(declare-fun e!754305 () Bool)

(assert (=> b!1322979 (= e!754305 tp_is_empty!36149)))

(declare-fun b!1322980 () Bool)

(declare-fun res!878125 () Bool)

(assert (=> b!1322980 (=> (not res!878125) (not e!754308))))

(declare-datatypes ((List!30534 0))(
  ( (Nil!30531) (Cons!30530 (h!31739 (_ BitVec 64)) (t!44412 List!30534)) )
))
(declare-fun arrayNoDuplicates!0 (array!89218 (_ BitVec 32) List!30534) Bool)

(assert (=> b!1322980 (= res!878125 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30531))))

(declare-fun mapNonEmpty!55871 () Bool)

(declare-fun mapRes!55871 () Bool)

(declare-fun tp!106463 () Bool)

(assert (=> mapNonEmpty!55871 (= mapRes!55871 (and tp!106463 e!754305))))

(declare-fun mapValue!55871 () ValueCell!17176)

(declare-fun mapKey!55871 () (_ BitVec 32))

(declare-fun mapRest!55871 () (Array (_ BitVec 32) ValueCell!17176))

(assert (=> mapNonEmpty!55871 (= (arr!43084 _values!1337) (store mapRest!55871 mapKey!55871 mapValue!55871))))

(declare-fun b!1322981 () Bool)

(declare-fun res!878131 () Bool)

(assert (=> b!1322981 (=> (not res!878131) (not e!754308))))

(assert (=> b!1322981 (= res!878131 (and (= (size!43634 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43633 _keys!1609) (size!43634 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322982 () Bool)

(declare-fun e!754309 () Bool)

(assert (=> b!1322982 (= e!754309 tp_is_empty!36149)))

(declare-fun b!1322983 () Bool)

(declare-fun res!878128 () Bool)

(assert (=> b!1322983 (=> (not res!878128) (not e!754308))))

(assert (=> b!1322983 (= res!878128 (not (= (select (arr!43083 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!55871 () Bool)

(assert (=> mapIsEmpty!55871 mapRes!55871))

(declare-fun b!1322984 () Bool)

(assert (=> b!1322984 (= e!754306 (and e!754309 mapRes!55871))))

(declare-fun condMapEmpty!55871 () Bool)

(declare-fun mapDefault!55871 () ValueCell!17176)

