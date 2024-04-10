; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111678 () Bool)

(assert start!111678)

(declare-fun b_free!30335 () Bool)

(declare-fun b_next!30335 () Bool)

(assert (=> start!111678 (= b_free!30335 (not b_next!30335))))

(declare-fun tp!106480 () Bool)

(declare-fun b_and!48829 () Bool)

(assert (=> start!111678 (= tp!106480 b_and!48829)))

(declare-fun mapIsEmpty!55880 () Bool)

(declare-fun mapRes!55880 () Bool)

(assert (=> mapIsEmpty!55880 mapRes!55880))

(declare-fun b!1323080 () Bool)

(declare-fun e!754353 () Bool)

(assert (=> b!1323080 (= e!754353 (not true))))

(declare-datatypes ((V!53309 0))(
  ( (V!53310 (val!18152 Int)) )
))
(declare-datatypes ((tuple2!23396 0))(
  ( (tuple2!23397 (_1!11709 (_ BitVec 64)) (_2!11709 V!53309)) )
))
(declare-datatypes ((List!30538 0))(
  ( (Nil!30535) (Cons!30534 (h!31743 tuple2!23396) (t!44422 List!30538)) )
))
(declare-datatypes ((ListLongMap!21053 0))(
  ( (ListLongMap!21054 (toList!10542 List!30538)) )
))
(declare-fun lt!588705 () ListLongMap!21053)

(declare-fun minValue!1279 () V!53309)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8697 (ListLongMap!21053 (_ BitVec 64)) Bool)

(declare-fun +!4594 (ListLongMap!21053 tuple2!23396) ListLongMap!21053)

(assert (=> b!1323080 (contains!8697 (+!4594 lt!588705 (tuple2!23397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43608 0))(
  ( (Unit!43609) )
))
(declare-fun lt!588700 () Unit!43608)

(declare-fun addStillContains!1143 (ListLongMap!21053 (_ BitVec 64) V!53309 (_ BitVec 64)) Unit!43608)

(assert (=> b!1323080 (= lt!588700 (addStillContains!1143 lt!588705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323080 (contains!8697 lt!588705 k!1164)))

(declare-fun lt!588703 () ListLongMap!21053)

(declare-fun lt!588698 () tuple2!23396)

(assert (=> b!1323080 (= lt!588705 (+!4594 lt!588703 lt!588698))))

(declare-fun zeroValue!1279 () V!53309)

(declare-fun lt!588695 () Unit!43608)

(assert (=> b!1323080 (= lt!588695 (addStillContains!1143 lt!588703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323080 (contains!8697 lt!588703 k!1164)))

(declare-datatypes ((array!89230 0))(
  ( (array!89231 (arr!43089 (Array (_ BitVec 32) (_ BitVec 64))) (size!43639 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89230)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588702 () Unit!43608)

(declare-fun lt!588704 () V!53309)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!190 ((_ BitVec 64) (_ BitVec 64) V!53309 ListLongMap!21053) Unit!43608)

(assert (=> b!1323080 (= lt!588702 (lemmaInListMapAfterAddingDiffThenInBefore!190 k!1164 (select (arr!43089 _keys!1609) from!2000) lt!588704 lt!588703))))

(declare-fun lt!588701 () ListLongMap!21053)

(assert (=> b!1323080 (contains!8697 lt!588701 k!1164)))

(declare-fun lt!588697 () Unit!43608)

(assert (=> b!1323080 (= lt!588697 (lemmaInListMapAfterAddingDiffThenInBefore!190 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588701))))

(declare-fun lt!588699 () ListLongMap!21053)

(assert (=> b!1323080 (contains!8697 lt!588699 k!1164)))

(declare-fun lt!588696 () Unit!43608)

(assert (=> b!1323080 (= lt!588696 (lemmaInListMapAfterAddingDiffThenInBefore!190 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588699))))

(assert (=> b!1323080 (= lt!588699 (+!4594 lt!588701 lt!588698))))

(assert (=> b!1323080 (= lt!588698 (tuple2!23397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323080 (= lt!588701 (+!4594 lt!588703 (tuple2!23397 (select (arr!43089 _keys!1609) from!2000) lt!588704)))))

(declare-datatypes ((ValueCell!17179 0))(
  ( (ValueCellFull!17179 (v!20782 V!53309)) (EmptyCell!17179) )
))
(declare-datatypes ((array!89232 0))(
  ( (array!89233 (arr!43090 (Array (_ BitVec 32) ValueCell!17179)) (size!43640 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89232)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21696 (ValueCell!17179 V!53309) V!53309)

(declare-fun dynLambda!3533 (Int (_ BitVec 64)) V!53309)

(assert (=> b!1323080 (= lt!588704 (get!21696 (select (arr!43090 _values!1337) from!2000) (dynLambda!3533 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6229 (array!89230 array!89232 (_ BitVec 32) (_ BitVec 32) V!53309 V!53309 (_ BitVec 32) Int) ListLongMap!21053)

(assert (=> b!1323080 (= lt!588703 (getCurrentListMapNoExtraKeys!6229 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323081 () Bool)

(declare-fun res!878200 () Bool)

(assert (=> b!1323081 (=> (not res!878200) (not e!754353))))

(assert (=> b!1323081 (= res!878200 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43639 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323082 () Bool)

(declare-fun res!878199 () Bool)

(assert (=> b!1323082 (=> (not res!878199) (not e!754353))))

(declare-datatypes ((List!30539 0))(
  ( (Nil!30536) (Cons!30535 (h!31744 (_ BitVec 64)) (t!44423 List!30539)) )
))
(declare-fun arrayNoDuplicates!0 (array!89230 (_ BitVec 32) List!30539) Bool)

(assert (=> b!1323082 (= res!878199 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30536))))

(declare-fun b!1323084 () Bool)

(declare-fun res!878201 () Bool)

(assert (=> b!1323084 (=> (not res!878201) (not e!754353))))

(assert (=> b!1323084 (= res!878201 (not (= (select (arr!43089 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1323085 () Bool)

(declare-fun res!878204 () Bool)

(assert (=> b!1323085 (=> (not res!878204) (not e!754353))))

(declare-fun getCurrentListMap!5539 (array!89230 array!89232 (_ BitVec 32) (_ BitVec 32) V!53309 V!53309 (_ BitVec 32) Int) ListLongMap!21053)

(assert (=> b!1323085 (= res!878204 (contains!8697 (getCurrentListMap!5539 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323086 () Bool)

(declare-fun e!754350 () Bool)

(declare-fun e!754352 () Bool)

(assert (=> b!1323086 (= e!754350 (and e!754352 mapRes!55880))))

(declare-fun condMapEmpty!55880 () Bool)

(declare-fun mapDefault!55880 () ValueCell!17179)

