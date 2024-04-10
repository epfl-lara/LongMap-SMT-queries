; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111716 () Bool)

(assert start!111716)

(declare-fun b_free!30373 () Bool)

(declare-fun b_next!30373 () Bool)

(assert (=> start!111716 (= b_free!30373 (not b_next!30373))))

(declare-fun tp!106595 () Bool)

(declare-fun b_and!48905 () Bool)

(assert (=> start!111716 (= tp!106595 b_and!48905)))

(declare-fun b!1323745 () Bool)

(declare-fun e!754638 () Bool)

(declare-fun tp_is_empty!36193 () Bool)

(assert (=> b!1323745 (= e!754638 tp_is_empty!36193)))

(declare-fun b!1323746 () Bool)

(declare-fun res!878657 () Bool)

(declare-fun e!754636 () Bool)

(assert (=> b!1323746 (=> (not res!878657) (not e!754636))))

(declare-datatypes ((array!89302 0))(
  ( (array!89303 (arr!43125 (Array (_ BitVec 32) (_ BitVec 64))) (size!43675 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89302)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53361 0))(
  ( (V!53362 (val!18171 Int)) )
))
(declare-fun zeroValue!1279 () V!53361)

(declare-datatypes ((ValueCell!17198 0))(
  ( (ValueCellFull!17198 (v!20801 V!53361)) (EmptyCell!17198) )
))
(declare-datatypes ((array!89304 0))(
  ( (array!89305 (arr!43126 (Array (_ BitVec 32) ValueCell!17198)) (size!43676 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89304)

(declare-fun minValue!1279 () V!53361)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23426 0))(
  ( (tuple2!23427 (_1!11724 (_ BitVec 64)) (_2!11724 V!53361)) )
))
(declare-datatypes ((List!30568 0))(
  ( (Nil!30565) (Cons!30564 (h!31773 tuple2!23426) (t!44490 List!30568)) )
))
(declare-datatypes ((ListLongMap!21083 0))(
  ( (ListLongMap!21084 (toList!10557 List!30568)) )
))
(declare-fun contains!8712 (ListLongMap!21083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5553 (array!89302 array!89304 (_ BitVec 32) (_ BitVec 32) V!53361 V!53361 (_ BitVec 32) Int) ListLongMap!21083)

(assert (=> b!1323746 (= res!878657 (contains!8712 (getCurrentListMap!5553 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323747 () Bool)

(assert (=> b!1323747 (= e!754636 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!589329 () ListLongMap!21083)

(declare-fun +!4608 (ListLongMap!21083 tuple2!23426) ListLongMap!21083)

(assert (=> b!1323747 (contains!8712 (+!4608 lt!589329 (tuple2!23427 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43636 0))(
  ( (Unit!43637) )
))
(declare-fun lt!589322 () Unit!43636)

(declare-fun addStillContains!1157 (ListLongMap!21083 (_ BitVec 64) V!53361 (_ BitVec 64)) Unit!43636)

(assert (=> b!1323747 (= lt!589322 (addStillContains!1157 lt!589329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323747 (contains!8712 lt!589329 k!1164)))

(declare-fun lt!589332 () ListLongMap!21083)

(declare-fun lt!589327 () tuple2!23426)

(assert (=> b!1323747 (= lt!589329 (+!4608 lt!589332 lt!589327))))

(declare-fun lt!589330 () Unit!43636)

(assert (=> b!1323747 (= lt!589330 (addStillContains!1157 lt!589332 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323747 (contains!8712 lt!589332 k!1164)))

(declare-fun lt!589325 () V!53361)

(declare-fun lt!589331 () Unit!43636)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!204 ((_ BitVec 64) (_ BitVec 64) V!53361 ListLongMap!21083) Unit!43636)

(assert (=> b!1323747 (= lt!589331 (lemmaInListMapAfterAddingDiffThenInBefore!204 k!1164 (select (arr!43125 _keys!1609) from!2000) lt!589325 lt!589332))))

(declare-fun lt!589328 () ListLongMap!21083)

(assert (=> b!1323747 (contains!8712 lt!589328 k!1164)))

(declare-fun lt!589323 () Unit!43636)

(assert (=> b!1323747 (= lt!589323 (lemmaInListMapAfterAddingDiffThenInBefore!204 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589328))))

(declare-fun lt!589324 () ListLongMap!21083)

(assert (=> b!1323747 (contains!8712 lt!589324 k!1164)))

(declare-fun lt!589326 () Unit!43636)

(assert (=> b!1323747 (= lt!589326 (lemmaInListMapAfterAddingDiffThenInBefore!204 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589324))))

(assert (=> b!1323747 (= lt!589324 (+!4608 lt!589328 lt!589327))))

(assert (=> b!1323747 (= lt!589327 (tuple2!23427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323747 (= lt!589328 (+!4608 lt!589332 (tuple2!23427 (select (arr!43125 _keys!1609) from!2000) lt!589325)))))

(declare-fun get!21724 (ValueCell!17198 V!53361) V!53361)

(declare-fun dynLambda!3547 (Int (_ BitVec 64)) V!53361)

(assert (=> b!1323747 (= lt!589325 (get!21724 (select (arr!43126 _values!1337) from!2000) (dynLambda!3547 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6243 (array!89302 array!89304 (_ BitVec 32) (_ BitVec 32) V!53361 V!53361 (_ BitVec 32) Int) ListLongMap!21083)

(assert (=> b!1323747 (= lt!589332 (getCurrentListMapNoExtraKeys!6243 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323748 () Bool)

(declare-fun e!754637 () Bool)

(declare-fun e!754639 () Bool)

(declare-fun mapRes!55937 () Bool)

(assert (=> b!1323748 (= e!754637 (and e!754639 mapRes!55937))))

(declare-fun condMapEmpty!55937 () Bool)

(declare-fun mapDefault!55937 () ValueCell!17198)

