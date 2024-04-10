; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111692 () Bool)

(assert start!111692)

(declare-fun b_free!30349 () Bool)

(declare-fun b_next!30349 () Bool)

(assert (=> start!111692 (= b_free!30349 (not b_next!30349))))

(declare-fun tp!106523 () Bool)

(declare-fun b_and!48857 () Bool)

(assert (=> start!111692 (= tp!106523 b_and!48857)))

(declare-fun b!1323325 () Bool)

(declare-fun e!754455 () Bool)

(declare-fun tp_is_empty!36169 () Bool)

(assert (=> b!1323325 (= e!754455 tp_is_empty!36169)))

(declare-fun b!1323326 () Bool)

(declare-fun e!754458 () Bool)

(assert (=> b!1323326 (= e!754458 tp_is_empty!36169)))

(declare-fun b!1323327 () Bool)

(declare-fun res!878365 () Bool)

(declare-fun e!754459 () Bool)

(assert (=> b!1323327 (=> (not res!878365) (not e!754459))))

(declare-datatypes ((array!89256 0))(
  ( (array!89257 (arr!43102 (Array (_ BitVec 32) (_ BitVec 64))) (size!43652 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89256)

(declare-datatypes ((List!30548 0))(
  ( (Nil!30545) (Cons!30544 (h!31753 (_ BitVec 64)) (t!44446 List!30548)) )
))
(declare-fun arrayNoDuplicates!0 (array!89256 (_ BitVec 32) List!30548) Bool)

(assert (=> b!1323327 (= res!878365 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30545))))

(declare-fun b!1323328 () Bool)

(declare-fun res!878366 () Bool)

(assert (=> b!1323328 (=> (not res!878366) (not e!754459))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53329 0))(
  ( (V!53330 (val!18159 Int)) )
))
(declare-fun zeroValue!1279 () V!53329)

(declare-datatypes ((ValueCell!17186 0))(
  ( (ValueCellFull!17186 (v!20789 V!53329)) (EmptyCell!17186) )
))
(declare-datatypes ((array!89258 0))(
  ( (array!89259 (arr!43103 (Array (_ BitVec 32) ValueCell!17186)) (size!43653 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89258)

(declare-fun minValue!1279 () V!53329)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23406 0))(
  ( (tuple2!23407 (_1!11714 (_ BitVec 64)) (_2!11714 V!53329)) )
))
(declare-datatypes ((List!30549 0))(
  ( (Nil!30546) (Cons!30545 (h!31754 tuple2!23406) (t!44447 List!30549)) )
))
(declare-datatypes ((ListLongMap!21063 0))(
  ( (ListLongMap!21064 (toList!10547 List!30549)) )
))
(declare-fun contains!8702 (ListLongMap!21063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5544 (array!89256 array!89258 (_ BitVec 32) (_ BitVec 32) V!53329 V!53329 (_ BitVec 32) Int) ListLongMap!21063)

(assert (=> b!1323328 (= res!878366 (contains!8702 (getCurrentListMap!5544 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323329 () Bool)

(declare-fun res!878372 () Bool)

(assert (=> b!1323329 (=> (not res!878372) (not e!754459))))

(assert (=> b!1323329 (= res!878372 (and (= (size!43653 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43652 _keys!1609) (size!43653 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323330 () Bool)

(assert (=> b!1323330 (= e!754459 (not true))))

(declare-fun lt!588933 () ListLongMap!21063)

(declare-fun +!4599 (ListLongMap!21063 tuple2!23406) ListLongMap!21063)

(assert (=> b!1323330 (contains!8702 (+!4599 lt!588933 (tuple2!23407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43618 0))(
  ( (Unit!43619) )
))
(declare-fun lt!588931 () Unit!43618)

(declare-fun addStillContains!1148 (ListLongMap!21063 (_ BitVec 64) V!53329 (_ BitVec 64)) Unit!43618)

(assert (=> b!1323330 (= lt!588931 (addStillContains!1148 lt!588933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323330 (contains!8702 lt!588933 k!1164)))

(declare-fun lt!588928 () ListLongMap!21063)

(declare-fun lt!588927 () tuple2!23406)

(assert (=> b!1323330 (= lt!588933 (+!4599 lt!588928 lt!588927))))

(declare-fun lt!588936 () Unit!43618)

(assert (=> b!1323330 (= lt!588936 (addStillContains!1148 lt!588928 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323330 (contains!8702 lt!588928 k!1164)))

(declare-fun lt!588926 () Unit!43618)

(declare-fun lt!588935 () V!53329)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!195 ((_ BitVec 64) (_ BitVec 64) V!53329 ListLongMap!21063) Unit!43618)

(assert (=> b!1323330 (= lt!588926 (lemmaInListMapAfterAddingDiffThenInBefore!195 k!1164 (select (arr!43102 _keys!1609) from!2000) lt!588935 lt!588928))))

(declare-fun lt!588930 () ListLongMap!21063)

(assert (=> b!1323330 (contains!8702 lt!588930 k!1164)))

(declare-fun lt!588932 () Unit!43618)

(assert (=> b!1323330 (= lt!588932 (lemmaInListMapAfterAddingDiffThenInBefore!195 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588930))))

(declare-fun lt!588929 () ListLongMap!21063)

(assert (=> b!1323330 (contains!8702 lt!588929 k!1164)))

(declare-fun lt!588934 () Unit!43618)

(assert (=> b!1323330 (= lt!588934 (lemmaInListMapAfterAddingDiffThenInBefore!195 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588929))))

(assert (=> b!1323330 (= lt!588929 (+!4599 lt!588930 lt!588927))))

(assert (=> b!1323330 (= lt!588927 (tuple2!23407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323330 (= lt!588930 (+!4599 lt!588928 (tuple2!23407 (select (arr!43102 _keys!1609) from!2000) lt!588935)))))

(declare-fun get!21707 (ValueCell!17186 V!53329) V!53329)

(declare-fun dynLambda!3538 (Int (_ BitVec 64)) V!53329)

(assert (=> b!1323330 (= lt!588935 (get!21707 (select (arr!43103 _values!1337) from!2000) (dynLambda!3538 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6234 (array!89256 array!89258 (_ BitVec 32) (_ BitVec 32) V!53329 V!53329 (_ BitVec 32) Int) ListLongMap!21063)

(assert (=> b!1323330 (= lt!588928 (getCurrentListMapNoExtraKeys!6234 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!878367 () Bool)

(assert (=> start!111692 (=> (not res!878367) (not e!754459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111692 (= res!878367 (validMask!0 mask!2019))))

(assert (=> start!111692 e!754459))

(declare-fun array_inv!32541 (array!89256) Bool)

(assert (=> start!111692 (array_inv!32541 _keys!1609)))

(assert (=> start!111692 true))

(assert (=> start!111692 tp_is_empty!36169))

(declare-fun e!754456 () Bool)

(declare-fun array_inv!32542 (array!89258) Bool)

(assert (=> start!111692 (and (array_inv!32542 _values!1337) e!754456)))

(assert (=> start!111692 tp!106523))

(declare-fun mapIsEmpty!55901 () Bool)

(declare-fun mapRes!55901 () Bool)

(assert (=> mapIsEmpty!55901 mapRes!55901))

(declare-fun b!1323331 () Bool)

(assert (=> b!1323331 (= e!754456 (and e!754455 mapRes!55901))))

(declare-fun condMapEmpty!55901 () Bool)

(declare-fun mapDefault!55901 () ValueCell!17186)

