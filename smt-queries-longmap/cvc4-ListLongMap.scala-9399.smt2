; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111892 () Bool)

(assert start!111892)

(declare-fun b_free!30491 () Bool)

(declare-fun b_next!30491 () Bool)

(assert (=> start!111892 (= b_free!30491 (not b_next!30491))))

(declare-fun tp!106953 () Bool)

(declare-fun b_and!49077 () Bool)

(assert (=> start!111892 (= tp!106953 b_and!49077)))

(declare-fun b!1325873 () Bool)

(declare-fun res!879973 () Bool)

(declare-fun e!755778 () Bool)

(assert (=> b!1325873 (=> (not res!879973) (not e!755778))))

(declare-datatypes ((array!89528 0))(
  ( (array!89529 (arr!43237 (Array (_ BitVec 32) (_ BitVec 64))) (size!43787 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89528)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53517 0))(
  ( (V!53518 (val!18230 Int)) )
))
(declare-datatypes ((ValueCell!17257 0))(
  ( (ValueCellFull!17257 (v!20863 V!53517)) (EmptyCell!17257) )
))
(declare-datatypes ((array!89530 0))(
  ( (array!89531 (arr!43238 (Array (_ BitVec 32) ValueCell!17257)) (size!43788 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89530)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325873 (= res!879973 (and (= (size!43788 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43787 _keys!1609) (size!43788 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!879969 () Bool)

(assert (=> start!111892 (=> (not res!879969) (not e!755778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111892 (= res!879969 (validMask!0 mask!2019))))

(assert (=> start!111892 e!755778))

(declare-fun array_inv!32637 (array!89528) Bool)

(assert (=> start!111892 (array_inv!32637 _keys!1609)))

(assert (=> start!111892 true))

(declare-fun tp_is_empty!36311 () Bool)

(assert (=> start!111892 tp_is_empty!36311))

(declare-fun e!755781 () Bool)

(declare-fun array_inv!32638 (array!89530) Bool)

(assert (=> start!111892 (and (array_inv!32638 _values!1337) e!755781)))

(assert (=> start!111892 tp!106953))

(declare-fun b!1325874 () Bool)

(assert (=> b!1325874 (= e!755778 (not true))))

(declare-datatypes ((tuple2!23514 0))(
  ( (tuple2!23515 (_1!11768 (_ BitVec 64)) (_2!11768 V!53517)) )
))
(declare-datatypes ((List!30654 0))(
  ( (Nil!30651) (Cons!30650 (h!31859 tuple2!23514) (t!44616 List!30654)) )
))
(declare-datatypes ((ListLongMap!21171 0))(
  ( (ListLongMap!21172 (toList!10601 List!30654)) )
))
(declare-fun lt!589856 () ListLongMap!21171)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8758 (ListLongMap!21171 (_ BitVec 64)) Bool)

(assert (=> b!1325874 (contains!8758 lt!589856 k!1164)))

(declare-datatypes ((Unit!43676 0))(
  ( (Unit!43677) )
))
(declare-fun lt!589857 () Unit!43676)

(declare-fun minValue!1279 () V!53517)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!216 ((_ BitVec 64) (_ BitVec 64) V!53517 ListLongMap!21171) Unit!43676)

(assert (=> b!1325874 (= lt!589857 (lemmaInListMapAfterAddingDiffThenInBefore!216 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589856))))

(declare-fun zeroValue!1279 () V!53517)

(declare-fun defaultEntry!1340 () Int)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun +!4624 (ListLongMap!21171 tuple2!23514) ListLongMap!21171)

(declare-fun getCurrentListMapNoExtraKeys!6262 (array!89528 array!89530 (_ BitVec 32) (_ BitVec 32) V!53517 V!53517 (_ BitVec 32) Int) ListLongMap!21171)

(declare-fun get!21781 (ValueCell!17257 V!53517) V!53517)

(declare-fun dynLambda!3563 (Int (_ BitVec 64)) V!53517)

(assert (=> b!1325874 (= lt!589856 (+!4624 (+!4624 (getCurrentListMapNoExtraKeys!6262 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23515 (select (arr!43237 _keys!1609) from!2000) (get!21781 (select (arr!43238 _values!1337) from!2000) (dynLambda!3563 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325875 () Bool)

(declare-fun e!755780 () Bool)

(declare-fun mapRes!56118 () Bool)

(assert (=> b!1325875 (= e!755781 (and e!755780 mapRes!56118))))

(declare-fun condMapEmpty!56118 () Bool)

(declare-fun mapDefault!56118 () ValueCell!17257)

