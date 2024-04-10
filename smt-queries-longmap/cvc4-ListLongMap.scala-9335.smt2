; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111450 () Bool)

(assert start!111450)

(declare-fun b_free!30107 () Bool)

(declare-fun b_next!30107 () Bool)

(assert (=> start!111450 (= b_free!30107 (not b_next!30107))))

(declare-fun tp!105797 () Bool)

(declare-fun b_and!48373 () Bool)

(assert (=> start!111450 (= tp!105797 b_and!48373)))

(declare-fun mapIsEmpty!55538 () Bool)

(declare-fun mapRes!55538 () Bool)

(assert (=> mapIsEmpty!55538 mapRes!55538))

(declare-fun b!1319090 () Bool)

(declare-fun e!752643 () Bool)

(declare-fun tp_is_empty!35927 () Bool)

(assert (=> b!1319090 (= e!752643 tp_is_empty!35927)))

(declare-fun res!875461 () Bool)

(declare-fun e!752642 () Bool)

(assert (=> start!111450 (=> (not res!875461) (not e!752642))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111450 (= res!875461 (validMask!0 mask!2019))))

(assert (=> start!111450 e!752642))

(declare-datatypes ((array!88792 0))(
  ( (array!88793 (arr!42870 (Array (_ BitVec 32) (_ BitVec 64))) (size!43420 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88792)

(declare-fun array_inv!32367 (array!88792) Bool)

(assert (=> start!111450 (array_inv!32367 _keys!1609)))

(assert (=> start!111450 true))

(assert (=> start!111450 tp_is_empty!35927))

(declare-datatypes ((V!53005 0))(
  ( (V!53006 (val!18038 Int)) )
))
(declare-datatypes ((ValueCell!17065 0))(
  ( (ValueCellFull!17065 (v!20668 V!53005)) (EmptyCell!17065) )
))
(declare-datatypes ((array!88794 0))(
  ( (array!88795 (arr!42871 (Array (_ BitVec 32) ValueCell!17065)) (size!43421 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88794)

(declare-fun e!752641 () Bool)

(declare-fun array_inv!32368 (array!88794) Bool)

(assert (=> start!111450 (and (array_inv!32368 _values!1337) e!752641)))

(assert (=> start!111450 tp!105797))

(declare-fun b!1319091 () Bool)

(declare-fun res!875463 () Bool)

(assert (=> b!1319091 (=> (not res!875463) (not e!752642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88792 (_ BitVec 32)) Bool)

(assert (=> b!1319091 (= res!875463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319092 () Bool)

(declare-fun res!875464 () Bool)

(assert (=> b!1319092 (=> (not res!875464) (not e!752642))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1319092 (= res!875464 (and (= (size!43421 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43420 _keys!1609) (size!43421 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319093 () Bool)

(assert (=> b!1319093 (= e!752642 (not true))))

(declare-datatypes ((tuple2!23210 0))(
  ( (tuple2!23211 (_1!11616 (_ BitVec 64)) (_2!11616 V!53005)) )
))
(declare-datatypes ((List!30365 0))(
  ( (Nil!30362) (Cons!30361 (h!31570 tuple2!23210) (t!44021 List!30365)) )
))
(declare-datatypes ((ListLongMap!20867 0))(
  ( (ListLongMap!20868 (toList!10449 List!30365)) )
))
(declare-fun lt!586580 () ListLongMap!20867)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8604 (ListLongMap!20867 (_ BitVec 64)) Bool)

(assert (=> b!1319093 (contains!8604 lt!586580 k!1164)))

(declare-fun minValue!1279 () V!53005)

(declare-datatypes ((Unit!43440 0))(
  ( (Unit!43441) )
))
(declare-fun lt!586581 () Unit!43440)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!106 ((_ BitVec 64) (_ BitVec 64) V!53005 ListLongMap!20867) Unit!43440)

(assert (=> b!1319093 (= lt!586581 (lemmaInListMapAfterAddingDiffThenInBefore!106 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586580))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53005)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4510 (ListLongMap!20867 tuple2!23210) ListLongMap!20867)

(declare-fun getCurrentListMapNoExtraKeys!6145 (array!88792 array!88794 (_ BitVec 32) (_ BitVec 32) V!53005 V!53005 (_ BitVec 32) Int) ListLongMap!20867)

(declare-fun get!21536 (ValueCell!17065 V!53005) V!53005)

(declare-fun dynLambda!3449 (Int (_ BitVec 64)) V!53005)

(assert (=> b!1319093 (= lt!586580 (+!4510 (+!4510 (getCurrentListMapNoExtraKeys!6145 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23211 (select (arr!42870 _keys!1609) from!2000) (get!21536 (select (arr!42871 _values!1337) from!2000) (dynLambda!3449 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23211 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319094 () Bool)

(declare-fun res!875462 () Bool)

(assert (=> b!1319094 (=> (not res!875462) (not e!752642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319094 (= res!875462 (validKeyInArray!0 (select (arr!42870 _keys!1609) from!2000)))))

(declare-fun b!1319095 () Bool)

(declare-fun res!875465 () Bool)

(assert (=> b!1319095 (=> (not res!875465) (not e!752642))))

(declare-fun getCurrentListMap!5461 (array!88792 array!88794 (_ BitVec 32) (_ BitVec 32) V!53005 V!53005 (_ BitVec 32) Int) ListLongMap!20867)

(assert (=> b!1319095 (= res!875465 (contains!8604 (getCurrentListMap!5461 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319096 () Bool)

(declare-fun e!752640 () Bool)

(assert (=> b!1319096 (= e!752640 tp_is_empty!35927)))

(declare-fun b!1319097 () Bool)

(declare-fun res!875467 () Bool)

(assert (=> b!1319097 (=> (not res!875467) (not e!752642))))

(assert (=> b!1319097 (= res!875467 (not (= (select (arr!42870 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319098 () Bool)

(declare-fun res!875468 () Bool)

(assert (=> b!1319098 (=> (not res!875468) (not e!752642))))

(assert (=> b!1319098 (= res!875468 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43420 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55538 () Bool)

(declare-fun tp!105796 () Bool)

(assert (=> mapNonEmpty!55538 (= mapRes!55538 (and tp!105796 e!752643))))

(declare-fun mapValue!55538 () ValueCell!17065)

(declare-fun mapRest!55538 () (Array (_ BitVec 32) ValueCell!17065))

(declare-fun mapKey!55538 () (_ BitVec 32))

(assert (=> mapNonEmpty!55538 (= (arr!42871 _values!1337) (store mapRest!55538 mapKey!55538 mapValue!55538))))

(declare-fun b!1319099 () Bool)

(declare-fun res!875466 () Bool)

(assert (=> b!1319099 (=> (not res!875466) (not e!752642))))

(declare-datatypes ((List!30366 0))(
  ( (Nil!30363) (Cons!30362 (h!31571 (_ BitVec 64)) (t!44022 List!30366)) )
))
(declare-fun arrayNoDuplicates!0 (array!88792 (_ BitVec 32) List!30366) Bool)

(assert (=> b!1319099 (= res!875466 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30363))))

(declare-fun b!1319100 () Bool)

(assert (=> b!1319100 (= e!752641 (and e!752640 mapRes!55538))))

(declare-fun condMapEmpty!55538 () Bool)

(declare-fun mapDefault!55538 () ValueCell!17065)

