; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111916 () Bool)

(assert start!111916)

(declare-fun b_free!30515 () Bool)

(declare-fun b_next!30515 () Bool)

(assert (=> start!111916 (= b_free!30515 (not b_next!30515))))

(declare-fun tp!107025 () Bool)

(declare-fun b_and!49125 () Bool)

(assert (=> start!111916 (= tp!107025 b_and!49125)))

(declare-fun mapIsEmpty!56154 () Bool)

(declare-fun mapRes!56154 () Bool)

(assert (=> mapIsEmpty!56154 mapRes!56154))

(declare-fun b!1326293 () Bool)

(declare-fun res!880259 () Bool)

(declare-fun e!755961 () Bool)

(assert (=> b!1326293 (=> (not res!880259) (not e!755961))))

(declare-datatypes ((array!89576 0))(
  ( (array!89577 (arr!43261 (Array (_ BitVec 32) (_ BitVec 64))) (size!43811 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89576)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89576 (_ BitVec 32)) Bool)

(assert (=> b!1326293 (= res!880259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326294 () Bool)

(declare-fun res!880263 () Bool)

(assert (=> b!1326294 (=> (not res!880263) (not e!755961))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53549 0))(
  ( (V!53550 (val!18242 Int)) )
))
(declare-datatypes ((ValueCell!17269 0))(
  ( (ValueCellFull!17269 (v!20875 V!53549)) (EmptyCell!17269) )
))
(declare-datatypes ((array!89578 0))(
  ( (array!89579 (arr!43262 (Array (_ BitVec 32) ValueCell!17269)) (size!43812 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89578)

(assert (=> b!1326294 (= res!880263 (and (= (size!43812 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43811 _keys!1609) (size!43812 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56154 () Bool)

(declare-fun tp!107024 () Bool)

(declare-fun e!755962 () Bool)

(assert (=> mapNonEmpty!56154 (= mapRes!56154 (and tp!107024 e!755962))))

(declare-fun mapValue!56154 () ValueCell!17269)

(declare-fun mapKey!56154 () (_ BitVec 32))

(declare-fun mapRest!56154 () (Array (_ BitVec 32) ValueCell!17269))

(assert (=> mapNonEmpty!56154 (= (arr!43262 _values!1337) (store mapRest!56154 mapKey!56154 mapValue!56154))))

(declare-fun b!1326295 () Bool)

(declare-fun res!880262 () Bool)

(assert (=> b!1326295 (=> (not res!880262) (not e!755961))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326295 (= res!880262 (validKeyInArray!0 (select (arr!43261 _keys!1609) from!2000)))))

(declare-fun b!1326297 () Bool)

(declare-fun e!755958 () Bool)

(declare-fun tp_is_empty!36335 () Bool)

(assert (=> b!1326297 (= e!755958 tp_is_empty!36335)))

(declare-fun b!1326298 () Bool)

(assert (=> b!1326298 (= e!755962 tp_is_empty!36335)))

(declare-fun b!1326299 () Bool)

(declare-fun res!880258 () Bool)

(assert (=> b!1326299 (=> (not res!880258) (not e!755961))))

(declare-fun zeroValue!1279 () V!53549)

(declare-fun minValue!1279 () V!53549)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23536 0))(
  ( (tuple2!23537 (_1!11779 (_ BitVec 64)) (_2!11779 V!53549)) )
))
(declare-datatypes ((List!30672 0))(
  ( (Nil!30669) (Cons!30668 (h!31877 tuple2!23536) (t!44658 List!30672)) )
))
(declare-datatypes ((ListLongMap!21193 0))(
  ( (ListLongMap!21194 (toList!10612 List!30672)) )
))
(declare-fun contains!8769 (ListLongMap!21193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5603 (array!89576 array!89578 (_ BitVec 32) (_ BitVec 32) V!53549 V!53549 (_ BitVec 32) Int) ListLongMap!21193)

(assert (=> b!1326299 (= res!880258 (contains!8769 (getCurrentListMap!5603 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1326300 () Bool)

(assert (=> b!1326300 (= e!755961 (not (not (= k!1164 (select (arr!43261 _keys!1609) from!2000)))))))

(declare-fun lt!589999 () ListLongMap!21193)

(assert (=> b!1326300 (contains!8769 lt!589999 k!1164)))

(declare-datatypes ((Unit!43696 0))(
  ( (Unit!43697) )
))
(declare-fun lt!589998 () Unit!43696)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!226 ((_ BitVec 64) (_ BitVec 64) V!53549 ListLongMap!21193) Unit!43696)

(assert (=> b!1326300 (= lt!589998 (lemmaInListMapAfterAddingDiffThenInBefore!226 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589999))))

(declare-fun lt!590001 () ListLongMap!21193)

(assert (=> b!1326300 (contains!8769 lt!590001 k!1164)))

(declare-fun lt!590000 () Unit!43696)

(assert (=> b!1326300 (= lt!590000 (lemmaInListMapAfterAddingDiffThenInBefore!226 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590001))))

(declare-fun +!4634 (ListLongMap!21193 tuple2!23536) ListLongMap!21193)

(assert (=> b!1326300 (= lt!590001 (+!4634 lt!589999 (tuple2!23537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6272 (array!89576 array!89578 (_ BitVec 32) (_ BitVec 32) V!53549 V!53549 (_ BitVec 32) Int) ListLongMap!21193)

(declare-fun get!21799 (ValueCell!17269 V!53549) V!53549)

(declare-fun dynLambda!3573 (Int (_ BitVec 64)) V!53549)

(assert (=> b!1326300 (= lt!589999 (+!4634 (getCurrentListMapNoExtraKeys!6272 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23537 (select (arr!43261 _keys!1609) from!2000) (get!21799 (select (arr!43262 _values!1337) from!2000) (dynLambda!3573 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!880257 () Bool)

(assert (=> start!111916 (=> (not res!880257) (not e!755961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111916 (= res!880257 (validMask!0 mask!2019))))

(assert (=> start!111916 e!755961))

(declare-fun array_inv!32657 (array!89576) Bool)

(assert (=> start!111916 (array_inv!32657 _keys!1609)))

(assert (=> start!111916 true))

(assert (=> start!111916 tp_is_empty!36335))

(declare-fun e!755959 () Bool)

(declare-fun array_inv!32658 (array!89578) Bool)

(assert (=> start!111916 (and (array_inv!32658 _values!1337) e!755959)))

(assert (=> start!111916 tp!107025))

(declare-fun b!1326296 () Bool)

(declare-fun res!880260 () Bool)

(assert (=> b!1326296 (=> (not res!880260) (not e!755961))))

(assert (=> b!1326296 (= res!880260 (not (= (select (arr!43261 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1326301 () Bool)

(declare-fun res!880264 () Bool)

(assert (=> b!1326301 (=> (not res!880264) (not e!755961))))

(assert (=> b!1326301 (= res!880264 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43811 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326302 () Bool)

(declare-fun res!880261 () Bool)

(assert (=> b!1326302 (=> (not res!880261) (not e!755961))))

(declare-datatypes ((List!30673 0))(
  ( (Nil!30670) (Cons!30669 (h!31878 (_ BitVec 64)) (t!44659 List!30673)) )
))
(declare-fun arrayNoDuplicates!0 (array!89576 (_ BitVec 32) List!30673) Bool)

(assert (=> b!1326302 (= res!880261 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30670))))

(declare-fun b!1326303 () Bool)

(assert (=> b!1326303 (= e!755959 (and e!755958 mapRes!56154))))

(declare-fun condMapEmpty!56154 () Bool)

(declare-fun mapDefault!56154 () ValueCell!17269)

