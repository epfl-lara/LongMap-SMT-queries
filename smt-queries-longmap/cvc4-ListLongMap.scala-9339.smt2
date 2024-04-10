; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111474 () Bool)

(assert start!111474)

(declare-fun b_free!30131 () Bool)

(declare-fun b_next!30131 () Bool)

(assert (=> start!111474 (= b_free!30131 (not b_next!30131))))

(declare-fun tp!105868 () Bool)

(declare-fun b_and!48421 () Bool)

(assert (=> start!111474 (= tp!105868 b_and!48421)))

(declare-fun b!1319510 () Bool)

(declare-fun res!875749 () Bool)

(declare-fun e!752820 () Bool)

(assert (=> b!1319510 (=> (not res!875749) (not e!752820))))

(declare-datatypes ((array!88840 0))(
  ( (array!88841 (arr!42894 (Array (_ BitVec 32) (_ BitVec 64))) (size!43444 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88840)

(declare-datatypes ((List!30385 0))(
  ( (Nil!30382) (Cons!30381 (h!31590 (_ BitVec 64)) (t!44065 List!30385)) )
))
(declare-fun arrayNoDuplicates!0 (array!88840 (_ BitVec 32) List!30385) Bool)

(assert (=> b!1319510 (= res!875749 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30382))))

(declare-fun mapNonEmpty!55574 () Bool)

(declare-fun mapRes!55574 () Bool)

(declare-fun tp!105869 () Bool)

(declare-fun e!752821 () Bool)

(assert (=> mapNonEmpty!55574 (= mapRes!55574 (and tp!105869 e!752821))))

(declare-datatypes ((V!53037 0))(
  ( (V!53038 (val!18050 Int)) )
))
(declare-datatypes ((ValueCell!17077 0))(
  ( (ValueCellFull!17077 (v!20680 V!53037)) (EmptyCell!17077) )
))
(declare-datatypes ((array!88842 0))(
  ( (array!88843 (arr!42895 (Array (_ BitVec 32) ValueCell!17077)) (size!43445 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88842)

(declare-fun mapKey!55574 () (_ BitVec 32))

(declare-fun mapRest!55574 () (Array (_ BitVec 32) ValueCell!17077))

(declare-fun mapValue!55574 () ValueCell!17077)

(assert (=> mapNonEmpty!55574 (= (arr!42895 _values!1337) (store mapRest!55574 mapKey!55574 mapValue!55574))))

(declare-fun b!1319511 () Bool)

(declare-fun res!875753 () Bool)

(assert (=> b!1319511 (=> (not res!875753) (not e!752820))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319511 (= res!875753 (and (= (size!43445 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43444 _keys!1609) (size!43445 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319512 () Bool)

(declare-fun e!752824 () Bool)

(declare-fun tp_is_empty!35951 () Bool)

(assert (=> b!1319512 (= e!752824 tp_is_empty!35951)))

(declare-fun mapIsEmpty!55574 () Bool)

(assert (=> mapIsEmpty!55574 mapRes!55574))

(declare-fun b!1319514 () Bool)

(declare-fun res!875754 () Bool)

(assert (=> b!1319514 (=> (not res!875754) (not e!752820))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319514 (= res!875754 (validKeyInArray!0 (select (arr!42894 _keys!1609) from!2000)))))

(declare-fun b!1319515 () Bool)

(declare-fun res!875751 () Bool)

(assert (=> b!1319515 (=> (not res!875751) (not e!752820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88840 (_ BitVec 32)) Bool)

(assert (=> b!1319515 (= res!875751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319516 () Bool)

(assert (=> b!1319516 (= e!752820 (not true))))

(declare-datatypes ((tuple2!23232 0))(
  ( (tuple2!23233 (_1!11627 (_ BitVec 64)) (_2!11627 V!53037)) )
))
(declare-datatypes ((List!30386 0))(
  ( (Nil!30383) (Cons!30382 (h!31591 tuple2!23232) (t!44066 List!30386)) )
))
(declare-datatypes ((ListLongMap!20889 0))(
  ( (ListLongMap!20890 (toList!10460 List!30386)) )
))
(declare-fun lt!586653 () ListLongMap!20889)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8615 (ListLongMap!20889 (_ BitVec 64)) Bool)

(assert (=> b!1319516 (contains!8615 lt!586653 k!1164)))

(declare-datatypes ((Unit!43458 0))(
  ( (Unit!43459) )
))
(declare-fun lt!586652 () Unit!43458)

(declare-fun minValue!1279 () V!53037)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!115 ((_ BitVec 64) (_ BitVec 64) V!53037 ListLongMap!20889) Unit!43458)

(assert (=> b!1319516 (= lt!586652 (lemmaInListMapAfterAddingDiffThenInBefore!115 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586653))))

(declare-fun zeroValue!1279 () V!53037)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4519 (ListLongMap!20889 tuple2!23232) ListLongMap!20889)

(declare-fun getCurrentListMapNoExtraKeys!6154 (array!88840 array!88842 (_ BitVec 32) (_ BitVec 32) V!53037 V!53037 (_ BitVec 32) Int) ListLongMap!20889)

(declare-fun get!21553 (ValueCell!17077 V!53037) V!53037)

(declare-fun dynLambda!3458 (Int (_ BitVec 64)) V!53037)

(assert (=> b!1319516 (= lt!586653 (+!4519 (+!4519 (getCurrentListMapNoExtraKeys!6154 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23233 (select (arr!42894 _keys!1609) from!2000) (get!21553 (select (arr!42895 _values!1337) from!2000) (dynLambda!3458 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319517 () Bool)

(declare-fun res!875750 () Bool)

(assert (=> b!1319517 (=> (not res!875750) (not e!752820))))

(assert (=> b!1319517 (= res!875750 (not (= (select (arr!42894 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319518 () Bool)

(declare-fun e!752823 () Bool)

(assert (=> b!1319518 (= e!752823 (and e!752824 mapRes!55574))))

(declare-fun condMapEmpty!55574 () Bool)

(declare-fun mapDefault!55574 () ValueCell!17077)

