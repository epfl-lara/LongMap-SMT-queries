; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111662 () Bool)

(assert start!111662)

(declare-fun b_free!30319 () Bool)

(declare-fun b_next!30319 () Bool)

(assert (=> start!111662 (= b_free!30319 (not b_next!30319))))

(declare-fun tp!106432 () Bool)

(declare-fun b_and!48797 () Bool)

(assert (=> start!111662 (= tp!106432 b_and!48797)))

(declare-fun b!1322800 () Bool)

(declare-fun e!754231 () Bool)

(assert (=> b!1322800 (= e!754231 (not true))))

(declare-datatypes ((V!53289 0))(
  ( (V!53290 (val!18144 Int)) )
))
(declare-datatypes ((tuple2!23382 0))(
  ( (tuple2!23383 (_1!11702 (_ BitVec 64)) (_2!11702 V!53289)) )
))
(declare-datatypes ((List!30526 0))(
  ( (Nil!30523) (Cons!30522 (h!31731 tuple2!23382) (t!44394 List!30526)) )
))
(declare-datatypes ((ListLongMap!21039 0))(
  ( (ListLongMap!21040 (toList!10535 List!30526)) )
))
(declare-fun lt!588450 () ListLongMap!21039)

(declare-fun lt!588446 () tuple2!23382)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8690 (ListLongMap!21039 (_ BitVec 64)) Bool)

(declare-fun +!4587 (ListLongMap!21039 tuple2!23382) ListLongMap!21039)

(assert (=> b!1322800 (contains!8690 (+!4587 lt!588450 lt!588446) k!1164)))

(declare-datatypes ((Unit!43594 0))(
  ( (Unit!43595) )
))
(declare-fun lt!588445 () Unit!43594)

(declare-fun zeroValue!1279 () V!53289)

(declare-fun addStillContains!1136 (ListLongMap!21039 (_ BitVec 64) V!53289 (_ BitVec 64)) Unit!43594)

(assert (=> b!1322800 (= lt!588445 (addStillContains!1136 lt!588450 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322800 (contains!8690 lt!588450 k!1164)))

(declare-datatypes ((array!89198 0))(
  ( (array!89199 (arr!43073 (Array (_ BitVec 32) (_ BitVec 64))) (size!43623 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89198)

(declare-fun lt!588453 () V!53289)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588449 () Unit!43594)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!183 ((_ BitVec 64) (_ BitVec 64) V!53289 ListLongMap!21039) Unit!43594)

(assert (=> b!1322800 (= lt!588449 (lemmaInListMapAfterAddingDiffThenInBefore!183 k!1164 (select (arr!43073 _keys!1609) from!2000) lt!588453 lt!588450))))

(declare-fun lt!588452 () ListLongMap!21039)

(assert (=> b!1322800 (contains!8690 lt!588452 k!1164)))

(declare-fun lt!588451 () Unit!43594)

(assert (=> b!1322800 (= lt!588451 (lemmaInListMapAfterAddingDiffThenInBefore!183 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588452))))

(declare-fun lt!588447 () ListLongMap!21039)

(assert (=> b!1322800 (contains!8690 lt!588447 k!1164)))

(declare-fun lt!588448 () Unit!43594)

(declare-fun minValue!1279 () V!53289)

(assert (=> b!1322800 (= lt!588448 (lemmaInListMapAfterAddingDiffThenInBefore!183 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588447))))

(assert (=> b!1322800 (= lt!588447 (+!4587 lt!588452 lt!588446))))

(assert (=> b!1322800 (= lt!588446 (tuple2!23383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322800 (= lt!588452 (+!4587 lt!588450 (tuple2!23383 (select (arr!43073 _keys!1609) from!2000) lt!588453)))))

(declare-datatypes ((ValueCell!17171 0))(
  ( (ValueCellFull!17171 (v!20774 V!53289)) (EmptyCell!17171) )
))
(declare-datatypes ((array!89200 0))(
  ( (array!89201 (arr!43074 (Array (_ BitVec 32) ValueCell!17171)) (size!43624 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89200)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21685 (ValueCell!17171 V!53289) V!53289)

(declare-fun dynLambda!3526 (Int (_ BitVec 64)) V!53289)

(assert (=> b!1322800 (= lt!588453 (get!21685 (select (arr!43074 _values!1337) from!2000) (dynLambda!3526 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6222 (array!89198 array!89200 (_ BitVec 32) (_ BitVec 32) V!53289 V!53289 (_ BitVec 32) Int) ListLongMap!21039)

(assert (=> b!1322800 (= lt!588450 (getCurrentListMapNoExtraKeys!6222 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!878008 () Bool)

(assert (=> start!111662 (=> (not res!878008) (not e!754231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111662 (= res!878008 (validMask!0 mask!2019))))

(assert (=> start!111662 e!754231))

(declare-fun array_inv!32521 (array!89198) Bool)

(assert (=> start!111662 (array_inv!32521 _keys!1609)))

(assert (=> start!111662 true))

(declare-fun tp_is_empty!36139 () Bool)

(assert (=> start!111662 tp_is_empty!36139))

(declare-fun e!754230 () Bool)

(declare-fun array_inv!32522 (array!89200) Bool)

(assert (=> start!111662 (and (array_inv!32522 _values!1337) e!754230)))

(assert (=> start!111662 tp!106432))

(declare-fun b!1322801 () Bool)

(declare-fun e!754234 () Bool)

(assert (=> b!1322801 (= e!754234 tp_is_empty!36139)))

(declare-fun b!1322802 () Bool)

(declare-fun res!878012 () Bool)

(assert (=> b!1322802 (=> (not res!878012) (not e!754231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89198 (_ BitVec 32)) Bool)

(assert (=> b!1322802 (= res!878012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322803 () Bool)

(declare-fun res!878010 () Bool)

(assert (=> b!1322803 (=> (not res!878010) (not e!754231))))

(declare-fun getCurrentListMap!5534 (array!89198 array!89200 (_ BitVec 32) (_ BitVec 32) V!53289 V!53289 (_ BitVec 32) Int) ListLongMap!21039)

(assert (=> b!1322803 (= res!878010 (contains!8690 (getCurrentListMap!5534 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322804 () Bool)

(declare-fun e!754232 () Bool)

(declare-fun mapRes!55856 () Bool)

(assert (=> b!1322804 (= e!754230 (and e!754232 mapRes!55856))))

(declare-fun condMapEmpty!55856 () Bool)

(declare-fun mapDefault!55856 () ValueCell!17171)

