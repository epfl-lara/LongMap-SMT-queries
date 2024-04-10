; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111458 () Bool)

(assert start!111458)

(declare-fun b_free!30115 () Bool)

(declare-fun b_next!30115 () Bool)

(assert (=> start!111458 (= b_free!30115 (not b_next!30115))))

(declare-fun tp!105821 () Bool)

(declare-fun b_and!48389 () Bool)

(assert (=> start!111458 (= tp!105821 b_and!48389)))

(declare-fun b!1319230 () Bool)

(declare-fun res!875560 () Bool)

(declare-fun e!752704 () Bool)

(assert (=> b!1319230 (=> (not res!875560) (not e!752704))))

(declare-datatypes ((array!88808 0))(
  ( (array!88809 (arr!42878 (Array (_ BitVec 32) (_ BitVec 64))) (size!43428 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88808)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53017 0))(
  ( (V!53018 (val!18042 Int)) )
))
(declare-fun zeroValue!1279 () V!53017)

(declare-datatypes ((ValueCell!17069 0))(
  ( (ValueCellFull!17069 (v!20672 V!53017)) (EmptyCell!17069) )
))
(declare-datatypes ((array!88810 0))(
  ( (array!88811 (arr!42879 (Array (_ BitVec 32) ValueCell!17069)) (size!43429 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88810)

(declare-fun minValue!1279 () V!53017)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23216 0))(
  ( (tuple2!23217 (_1!11619 (_ BitVec 64)) (_2!11619 V!53017)) )
))
(declare-datatypes ((List!30371 0))(
  ( (Nil!30368) (Cons!30367 (h!31576 tuple2!23216) (t!44035 List!30371)) )
))
(declare-datatypes ((ListLongMap!20873 0))(
  ( (ListLongMap!20874 (toList!10452 List!30371)) )
))
(declare-fun contains!8607 (ListLongMap!20873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5463 (array!88808 array!88810 (_ BitVec 32) (_ BitVec 32) V!53017 V!53017 (_ BitVec 32) Int) ListLongMap!20873)

(assert (=> b!1319230 (= res!875560 (contains!8607 (getCurrentListMap!5463 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319231 () Bool)

(declare-fun res!875559 () Bool)

(assert (=> b!1319231 (=> (not res!875559) (not e!752704))))

(declare-datatypes ((List!30372 0))(
  ( (Nil!30369) (Cons!30368 (h!31577 (_ BitVec 64)) (t!44036 List!30372)) )
))
(declare-fun arrayNoDuplicates!0 (array!88808 (_ BitVec 32) List!30372) Bool)

(assert (=> b!1319231 (= res!875559 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30369))))

(declare-fun b!1319232 () Bool)

(declare-fun res!875563 () Bool)

(assert (=> b!1319232 (=> (not res!875563) (not e!752704))))

(assert (=> b!1319232 (= res!875563 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43428 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319233 () Bool)

(declare-fun e!752703 () Bool)

(declare-fun tp_is_empty!35935 () Bool)

(assert (=> b!1319233 (= e!752703 tp_is_empty!35935)))

(declare-fun b!1319234 () Bool)

(assert (=> b!1319234 (= e!752704 (not true))))

(declare-fun lt!586605 () ListLongMap!20873)

(assert (=> b!1319234 (contains!8607 lt!586605 k!1164)))

(declare-datatypes ((Unit!43446 0))(
  ( (Unit!43447) )
))
(declare-fun lt!586604 () Unit!43446)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!109 ((_ BitVec 64) (_ BitVec 64) V!53017 ListLongMap!20873) Unit!43446)

(assert (=> b!1319234 (= lt!586604 (lemmaInListMapAfterAddingDiffThenInBefore!109 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586605))))

(declare-fun +!4513 (ListLongMap!20873 tuple2!23216) ListLongMap!20873)

(declare-fun getCurrentListMapNoExtraKeys!6148 (array!88808 array!88810 (_ BitVec 32) (_ BitVec 32) V!53017 V!53017 (_ BitVec 32) Int) ListLongMap!20873)

(declare-fun get!21543 (ValueCell!17069 V!53017) V!53017)

(declare-fun dynLambda!3452 (Int (_ BitVec 64)) V!53017)

(assert (=> b!1319234 (= lt!586605 (+!4513 (+!4513 (getCurrentListMapNoExtraKeys!6148 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23217 (select (arr!42878 _keys!1609) from!2000) (get!21543 (select (arr!42879 _values!1337) from!2000) (dynLambda!3452 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23217 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapIsEmpty!55550 () Bool)

(declare-fun mapRes!55550 () Bool)

(assert (=> mapIsEmpty!55550 mapRes!55550))

(declare-fun b!1319236 () Bool)

(declare-fun res!875558 () Bool)

(assert (=> b!1319236 (=> (not res!875558) (not e!752704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319236 (= res!875558 (validKeyInArray!0 (select (arr!42878 _keys!1609) from!2000)))))

(declare-fun b!1319237 () Bool)

(declare-fun res!875564 () Bool)

(assert (=> b!1319237 (=> (not res!875564) (not e!752704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88808 (_ BitVec 32)) Bool)

(assert (=> b!1319237 (= res!875564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55550 () Bool)

(declare-fun tp!105820 () Bool)

(declare-fun e!752701 () Bool)

(assert (=> mapNonEmpty!55550 (= mapRes!55550 (and tp!105820 e!752701))))

(declare-fun mapValue!55550 () ValueCell!17069)

(declare-fun mapRest!55550 () (Array (_ BitVec 32) ValueCell!17069))

(declare-fun mapKey!55550 () (_ BitVec 32))

(assert (=> mapNonEmpty!55550 (= (arr!42879 _values!1337) (store mapRest!55550 mapKey!55550 mapValue!55550))))

(declare-fun b!1319238 () Bool)

(declare-fun res!875561 () Bool)

(assert (=> b!1319238 (=> (not res!875561) (not e!752704))))

(assert (=> b!1319238 (= res!875561 (not (= (select (arr!42878 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319239 () Bool)

(declare-fun res!875562 () Bool)

(assert (=> b!1319239 (=> (not res!875562) (not e!752704))))

(assert (=> b!1319239 (= res!875562 (and (= (size!43429 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43428 _keys!1609) (size!43429 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319240 () Bool)

(assert (=> b!1319240 (= e!752701 tp_is_empty!35935)))

(declare-fun res!875557 () Bool)

(assert (=> start!111458 (=> (not res!875557) (not e!752704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111458 (= res!875557 (validMask!0 mask!2019))))

(assert (=> start!111458 e!752704))

(declare-fun array_inv!32373 (array!88808) Bool)

(assert (=> start!111458 (array_inv!32373 _keys!1609)))

(assert (=> start!111458 true))

(assert (=> start!111458 tp_is_empty!35935))

(declare-fun e!752702 () Bool)

(declare-fun array_inv!32374 (array!88810) Bool)

(assert (=> start!111458 (and (array_inv!32374 _values!1337) e!752702)))

(assert (=> start!111458 tp!105821))

(declare-fun b!1319235 () Bool)

(assert (=> b!1319235 (= e!752702 (and e!752703 mapRes!55550))))

(declare-fun condMapEmpty!55550 () Bool)

(declare-fun mapDefault!55550 () ValueCell!17069)

