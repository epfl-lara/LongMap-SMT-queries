; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111464 () Bool)

(assert start!111464)

(declare-fun b_free!30121 () Bool)

(declare-fun b_next!30121 () Bool)

(assert (=> start!111464 (= b_free!30121 (not b_next!30121))))

(declare-fun tp!105838 () Bool)

(declare-fun b_and!48401 () Bool)

(assert (=> start!111464 (= tp!105838 b_and!48401)))

(declare-fun b!1319335 () Bool)

(declare-fun res!875630 () Bool)

(declare-fun e!752749 () Bool)

(assert (=> b!1319335 (=> (not res!875630) (not e!752749))))

(declare-datatypes ((array!88820 0))(
  ( (array!88821 (arr!42884 (Array (_ BitVec 32) (_ BitVec 64))) (size!43434 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88820)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319335 (= res!875630 (validKeyInArray!0 (select (arr!42884 _keys!1609) from!2000)))))

(declare-fun b!1319336 () Bool)

(declare-fun res!875633 () Bool)

(assert (=> b!1319336 (=> (not res!875633) (not e!752749))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53025 0))(
  ( (V!53026 (val!18045 Int)) )
))
(declare-datatypes ((ValueCell!17072 0))(
  ( (ValueCellFull!17072 (v!20675 V!53025)) (EmptyCell!17072) )
))
(declare-datatypes ((array!88822 0))(
  ( (array!88823 (arr!42885 (Array (_ BitVec 32) ValueCell!17072)) (size!43435 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88822)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319336 (= res!875633 (and (= (size!43435 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43434 _keys!1609) (size!43435 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55559 () Bool)

(declare-fun mapRes!55559 () Bool)

(assert (=> mapIsEmpty!55559 mapRes!55559))

(declare-fun b!1319337 () Bool)

(declare-fun res!875632 () Bool)

(assert (=> b!1319337 (=> (not res!875632) (not e!752749))))

(declare-fun zeroValue!1279 () V!53025)

(declare-fun minValue!1279 () V!53025)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23222 0))(
  ( (tuple2!23223 (_1!11622 (_ BitVec 64)) (_2!11622 V!53025)) )
))
(declare-datatypes ((List!30377 0))(
  ( (Nil!30374) (Cons!30373 (h!31582 tuple2!23222) (t!44047 List!30377)) )
))
(declare-datatypes ((ListLongMap!20879 0))(
  ( (ListLongMap!20880 (toList!10455 List!30377)) )
))
(declare-fun contains!8610 (ListLongMap!20879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5465 (array!88820 array!88822 (_ BitVec 32) (_ BitVec 32) V!53025 V!53025 (_ BitVec 32) Int) ListLongMap!20879)

(assert (=> b!1319337 (= res!875632 (contains!8610 (getCurrentListMap!5465 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319338 () Bool)

(declare-fun res!875631 () Bool)

(assert (=> b!1319338 (=> (not res!875631) (not e!752749))))

(assert (=> b!1319338 (= res!875631 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43434 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319339 () Bool)

(declare-fun res!875629 () Bool)

(assert (=> b!1319339 (=> (not res!875629) (not e!752749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88820 (_ BitVec 32)) Bool)

(assert (=> b!1319339 (= res!875629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55559 () Bool)

(declare-fun tp!105839 () Bool)

(declare-fun e!752747 () Bool)

(assert (=> mapNonEmpty!55559 (= mapRes!55559 (and tp!105839 e!752747))))

(declare-fun mapValue!55559 () ValueCell!17072)

(declare-fun mapRest!55559 () (Array (_ BitVec 32) ValueCell!17072))

(declare-fun mapKey!55559 () (_ BitVec 32))

(assert (=> mapNonEmpty!55559 (= (arr!42885 _values!1337) (store mapRest!55559 mapKey!55559 mapValue!55559))))

(declare-fun res!875636 () Bool)

(assert (=> start!111464 (=> (not res!875636) (not e!752749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111464 (= res!875636 (validMask!0 mask!2019))))

(assert (=> start!111464 e!752749))

(declare-fun array_inv!32377 (array!88820) Bool)

(assert (=> start!111464 (array_inv!32377 _keys!1609)))

(assert (=> start!111464 true))

(declare-fun tp_is_empty!35941 () Bool)

(assert (=> start!111464 tp_is_empty!35941))

(declare-fun e!752748 () Bool)

(declare-fun array_inv!32378 (array!88822) Bool)

(assert (=> start!111464 (and (array_inv!32378 _values!1337) e!752748)))

(assert (=> start!111464 tp!105838))

(declare-fun b!1319340 () Bool)

(assert (=> b!1319340 (= e!752749 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!586623 () ListLongMap!20879)

(assert (=> b!1319340 (contains!8610 lt!586623 k!1164)))

(declare-datatypes ((Unit!43452 0))(
  ( (Unit!43453) )
))
(declare-fun lt!586622 () Unit!43452)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!112 ((_ BitVec 64) (_ BitVec 64) V!53025 ListLongMap!20879) Unit!43452)

(assert (=> b!1319340 (= lt!586622 (lemmaInListMapAfterAddingDiffThenInBefore!112 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586623))))

(declare-fun +!4516 (ListLongMap!20879 tuple2!23222) ListLongMap!20879)

(declare-fun getCurrentListMapNoExtraKeys!6151 (array!88820 array!88822 (_ BitVec 32) (_ BitVec 32) V!53025 V!53025 (_ BitVec 32) Int) ListLongMap!20879)

(declare-fun get!21548 (ValueCell!17072 V!53025) V!53025)

(declare-fun dynLambda!3455 (Int (_ BitVec 64)) V!53025)

(assert (=> b!1319340 (= lt!586623 (+!4516 (+!4516 (getCurrentListMapNoExtraKeys!6151 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23223 (select (arr!42884 _keys!1609) from!2000) (get!21548 (select (arr!42885 _values!1337) from!2000) (dynLambda!3455 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23223 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319341 () Bool)

(assert (=> b!1319341 (= e!752747 tp_is_empty!35941)))

(declare-fun b!1319342 () Bool)

(declare-fun res!875635 () Bool)

(assert (=> b!1319342 (=> (not res!875635) (not e!752749))))

(assert (=> b!1319342 (= res!875635 (not (= (select (arr!42884 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319343 () Bool)

(declare-fun e!752745 () Bool)

(assert (=> b!1319343 (= e!752748 (and e!752745 mapRes!55559))))

(declare-fun condMapEmpty!55559 () Bool)

(declare-fun mapDefault!55559 () ValueCell!17072)

