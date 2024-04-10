; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111648 () Bool)

(assert start!111648)

(declare-fun b_free!30305 () Bool)

(declare-fun b_next!30305 () Bool)

(assert (=> start!111648 (= b_free!30305 (not b_next!30305))))

(declare-fun tp!106391 () Bool)

(declare-fun b_and!48769 () Bool)

(assert (=> start!111648 (= tp!106391 b_and!48769)))

(declare-fun b!1322555 () Bool)

(declare-fun res!877839 () Bool)

(declare-fun e!754127 () Bool)

(assert (=> b!1322555 (=> (not res!877839) (not e!754127))))

(declare-datatypes ((array!89172 0))(
  ( (array!89173 (arr!43060 (Array (_ BitVec 32) (_ BitVec 64))) (size!43610 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89172)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53269 0))(
  ( (V!53270 (val!18137 Int)) )
))
(declare-datatypes ((ValueCell!17164 0))(
  ( (ValueCellFull!17164 (v!20767 V!53269)) (EmptyCell!17164) )
))
(declare-datatypes ((array!89174 0))(
  ( (array!89175 (arr!43061 (Array (_ BitVec 32) ValueCell!17164)) (size!43611 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89174)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1322555 (= res!877839 (and (= (size!43611 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43610 _keys!1609) (size!43611 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!877840 () Bool)

(assert (=> start!111648 (=> (not res!877840) (not e!754127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111648 (= res!877840 (validMask!0 mask!2019))))

(assert (=> start!111648 e!754127))

(declare-fun array_inv!32511 (array!89172) Bool)

(assert (=> start!111648 (array_inv!32511 _keys!1609)))

(assert (=> start!111648 true))

(declare-fun tp_is_empty!36125 () Bool)

(assert (=> start!111648 tp_is_empty!36125))

(declare-fun e!754126 () Bool)

(declare-fun array_inv!32512 (array!89174) Bool)

(assert (=> start!111648 (and (array_inv!32512 _values!1337) e!754126)))

(assert (=> start!111648 tp!106391))

(declare-fun b!1322556 () Bool)

(declare-fun res!877841 () Bool)

(assert (=> b!1322556 (=> (not res!877841) (not e!754127))))

(declare-datatypes ((List!30515 0))(
  ( (Nil!30512) (Cons!30511 (h!31720 (_ BitVec 64)) (t!44369 List!30515)) )
))
(declare-fun arrayNoDuplicates!0 (array!89172 (_ BitVec 32) List!30515) Bool)

(assert (=> b!1322556 (= res!877841 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30512))))

(declare-fun b!1322557 () Bool)

(declare-fun e!754125 () Bool)

(assert (=> b!1322557 (= e!754125 tp_is_empty!36125)))

(declare-fun b!1322558 () Bool)

(declare-fun res!877843 () Bool)

(assert (=> b!1322558 (=> (not res!877843) (not e!754127))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53269)

(declare-fun minValue!1279 () V!53269)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23370 0))(
  ( (tuple2!23371 (_1!11696 (_ BitVec 64)) (_2!11696 V!53269)) )
))
(declare-datatypes ((List!30516 0))(
  ( (Nil!30513) (Cons!30512 (h!31721 tuple2!23370) (t!44370 List!30516)) )
))
(declare-datatypes ((ListLongMap!21027 0))(
  ( (ListLongMap!21028 (toList!10529 List!30516)) )
))
(declare-fun contains!8684 (ListLongMap!21027 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5530 (array!89172 array!89174 (_ BitVec 32) (_ BitVec 32) V!53269 V!53269 (_ BitVec 32) Int) ListLongMap!21027)

(assert (=> b!1322558 (= res!877843 (contains!8684 (getCurrentListMap!5530 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322559 () Bool)

(declare-fun res!877837 () Bool)

(assert (=> b!1322559 (=> (not res!877837) (not e!754127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89172 (_ BitVec 32)) Bool)

(assert (=> b!1322559 (= res!877837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322560 () Bool)

(declare-fun res!877842 () Bool)

(assert (=> b!1322560 (=> (not res!877842) (not e!754127))))

(assert (=> b!1322560 (= res!877842 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43610 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55835 () Bool)

(declare-fun mapRes!55835 () Bool)

(declare-fun tp!106390 () Bool)

(assert (=> mapNonEmpty!55835 (= mapRes!55835 (and tp!106390 e!754125))))

(declare-fun mapValue!55835 () ValueCell!17164)

(declare-fun mapRest!55835 () (Array (_ BitVec 32) ValueCell!17164))

(declare-fun mapKey!55835 () (_ BitVec 32))

(assert (=> mapNonEmpty!55835 (= (arr!43061 _values!1337) (store mapRest!55835 mapKey!55835 mapValue!55835))))

(declare-fun b!1322561 () Bool)

(declare-fun e!754128 () Bool)

(assert (=> b!1322561 (= e!754128 tp_is_empty!36125)))

(declare-fun b!1322562 () Bool)

(declare-fun res!877844 () Bool)

(assert (=> b!1322562 (=> (not res!877844) (not e!754127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322562 (= res!877844 (validKeyInArray!0 (select (arr!43060 _keys!1609) from!2000)))))

(declare-fun b!1322563 () Bool)

(assert (=> b!1322563 (= e!754127 (not true))))

(declare-fun lt!588257 () ListLongMap!21027)

(declare-fun lt!588259 () tuple2!23370)

(declare-fun +!4581 (ListLongMap!21027 tuple2!23370) ListLongMap!21027)

(assert (=> b!1322563 (contains!8684 (+!4581 lt!588257 lt!588259) k!1164)))

(declare-datatypes ((Unit!43582 0))(
  ( (Unit!43583) )
))
(declare-fun lt!588261 () Unit!43582)

(declare-fun addStillContains!1130 (ListLongMap!21027 (_ BitVec 64) V!53269 (_ BitVec 64)) Unit!43582)

(assert (=> b!1322563 (= lt!588261 (addStillContains!1130 lt!588257 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322563 (contains!8684 lt!588257 k!1164)))

(declare-fun lt!588264 () Unit!43582)

(declare-fun lt!588256 () V!53269)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!177 ((_ BitVec 64) (_ BitVec 64) V!53269 ListLongMap!21027) Unit!43582)

(assert (=> b!1322563 (= lt!588264 (lemmaInListMapAfterAddingDiffThenInBefore!177 k!1164 (select (arr!43060 _keys!1609) from!2000) lt!588256 lt!588257))))

(declare-fun lt!588260 () ListLongMap!21027)

(assert (=> b!1322563 (contains!8684 lt!588260 k!1164)))

(declare-fun lt!588262 () Unit!43582)

(assert (=> b!1322563 (= lt!588262 (lemmaInListMapAfterAddingDiffThenInBefore!177 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588260))))

(declare-fun lt!588263 () ListLongMap!21027)

(assert (=> b!1322563 (contains!8684 lt!588263 k!1164)))

(declare-fun lt!588258 () Unit!43582)

(assert (=> b!1322563 (= lt!588258 (lemmaInListMapAfterAddingDiffThenInBefore!177 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588263))))

(assert (=> b!1322563 (= lt!588263 (+!4581 lt!588260 lt!588259))))

(assert (=> b!1322563 (= lt!588259 (tuple2!23371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322563 (= lt!588260 (+!4581 lt!588257 (tuple2!23371 (select (arr!43060 _keys!1609) from!2000) lt!588256)))))

(declare-fun get!21673 (ValueCell!17164 V!53269) V!53269)

(declare-fun dynLambda!3520 (Int (_ BitVec 64)) V!53269)

(assert (=> b!1322563 (= lt!588256 (get!21673 (select (arr!43061 _values!1337) from!2000) (dynLambda!3520 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6216 (array!89172 array!89174 (_ BitVec 32) (_ BitVec 32) V!53269 V!53269 (_ BitVec 32) Int) ListLongMap!21027)

(assert (=> b!1322563 (= lt!588257 (getCurrentListMapNoExtraKeys!6216 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322564 () Bool)

(declare-fun res!877838 () Bool)

(assert (=> b!1322564 (=> (not res!877838) (not e!754127))))

(assert (=> b!1322564 (= res!877838 (not (= (select (arr!43060 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322565 () Bool)

(assert (=> b!1322565 (= e!754126 (and e!754128 mapRes!55835))))

(declare-fun condMapEmpty!55835 () Bool)

(declare-fun mapDefault!55835 () ValueCell!17164)

