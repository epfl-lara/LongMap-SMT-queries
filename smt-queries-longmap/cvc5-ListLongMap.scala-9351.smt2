; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111542 () Bool)

(assert start!111542)

(declare-fun b_free!30199 () Bool)

(declare-fun b_next!30199 () Bool)

(assert (=> start!111542 (= b_free!30199 (not b_next!30199))))

(declare-fun tp!106073 () Bool)

(declare-fun b_and!48557 () Bool)

(assert (=> start!111542 (= tp!106073 b_and!48557)))

(declare-fun b!1320700 () Bool)

(declare-fun res!876567 () Bool)

(declare-fun e!753332 () Bool)

(assert (=> b!1320700 (=> (not res!876567) (not e!753332))))

(declare-datatypes ((array!88968 0))(
  ( (array!88969 (arr!42958 (Array (_ BitVec 32) (_ BitVec 64))) (size!43508 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88968)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320700 (= res!876567 (not (= (select (arr!42958 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320701 () Bool)

(assert (=> b!1320701 (= e!753332 (not true))))

(declare-datatypes ((V!53129 0))(
  ( (V!53130 (val!18084 Int)) )
))
(declare-datatypes ((tuple2!23288 0))(
  ( (tuple2!23289 (_1!11655 (_ BitVec 64)) (_2!11655 V!53129)) )
))
(declare-datatypes ((List!30438 0))(
  ( (Nil!30435) (Cons!30434 (h!31643 tuple2!23288) (t!44186 List!30438)) )
))
(declare-datatypes ((ListLongMap!20945 0))(
  ( (ListLongMap!20946 (toList!10488 List!30438)) )
))
(declare-fun lt!587040 () ListLongMap!20945)

(declare-fun contains!8643 (ListLongMap!20945 (_ BitVec 64)) Bool)

(assert (=> b!1320701 (contains!8643 lt!587040 k!1164)))

(declare-fun zeroValue!1279 () V!53129)

(declare-datatypes ((Unit!43514 0))(
  ( (Unit!43515) )
))
(declare-fun lt!587043 () Unit!43514)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!143 ((_ BitVec 64) (_ BitVec 64) V!53129 ListLongMap!20945) Unit!43514)

(assert (=> b!1320701 (= lt!587043 (lemmaInListMapAfterAddingDiffThenInBefore!143 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587040))))

(declare-fun lt!587042 () ListLongMap!20945)

(assert (=> b!1320701 (contains!8643 lt!587042 k!1164)))

(declare-fun lt!587041 () Unit!43514)

(declare-fun minValue!1279 () V!53129)

(assert (=> b!1320701 (= lt!587041 (lemmaInListMapAfterAddingDiffThenInBefore!143 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587042))))

(declare-fun +!4547 (ListLongMap!20945 tuple2!23288) ListLongMap!20945)

(assert (=> b!1320701 (= lt!587042 (+!4547 lt!587040 (tuple2!23289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17111 0))(
  ( (ValueCellFull!17111 (v!20714 V!53129)) (EmptyCell!17111) )
))
(declare-datatypes ((array!88970 0))(
  ( (array!88971 (arr!42959 (Array (_ BitVec 32) ValueCell!17111)) (size!43509 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88970)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6182 (array!88968 array!88970 (_ BitVec 32) (_ BitVec 32) V!53129 V!53129 (_ BitVec 32) Int) ListLongMap!20945)

(declare-fun get!21605 (ValueCell!17111 V!53129) V!53129)

(declare-fun dynLambda!3486 (Int (_ BitVec 64)) V!53129)

(assert (=> b!1320701 (= lt!587040 (+!4547 (getCurrentListMapNoExtraKeys!6182 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23289 (select (arr!42958 _keys!1609) from!2000) (get!21605 (select (arr!42959 _values!1337) from!2000) (dynLambda!3486 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320702 () Bool)

(declare-fun e!753334 () Bool)

(declare-fun e!753330 () Bool)

(declare-fun mapRes!55676 () Bool)

(assert (=> b!1320702 (= e!753334 (and e!753330 mapRes!55676))))

(declare-fun condMapEmpty!55676 () Bool)

(declare-fun mapDefault!55676 () ValueCell!17111)

