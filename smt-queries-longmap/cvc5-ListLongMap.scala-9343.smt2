; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111494 () Bool)

(assert start!111494)

(declare-fun b_free!30151 () Bool)

(declare-fun b_next!30151 () Bool)

(assert (=> start!111494 (= b_free!30151 (not b_next!30151))))

(declare-fun tp!105928 () Bool)

(declare-fun b_and!48461 () Bool)

(assert (=> start!111494 (= tp!105928 b_and!48461)))

(declare-fun mapNonEmpty!55604 () Bool)

(declare-fun mapRes!55604 () Bool)

(declare-fun tp!105929 () Bool)

(declare-fun e!752972 () Bool)

(assert (=> mapNonEmpty!55604 (= mapRes!55604 (and tp!105929 e!752972))))

(declare-datatypes ((V!53065 0))(
  ( (V!53066 (val!18060 Int)) )
))
(declare-datatypes ((ValueCell!17087 0))(
  ( (ValueCellFull!17087 (v!20690 V!53065)) (EmptyCell!17087) )
))
(declare-fun mapRest!55604 () (Array (_ BitVec 32) ValueCell!17087))

(declare-fun mapKey!55604 () (_ BitVec 32))

(declare-fun mapValue!55604 () ValueCell!17087)

(declare-datatypes ((array!88878 0))(
  ( (array!88879 (arr!42913 (Array (_ BitVec 32) ValueCell!17087)) (size!43463 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88878)

(assert (=> mapNonEmpty!55604 (= (arr!42913 _values!1337) (store mapRest!55604 mapKey!55604 mapValue!55604))))

(declare-fun b!1319860 () Bool)

(declare-fun res!875990 () Bool)

(declare-fun e!752973 () Bool)

(assert (=> b!1319860 (=> (not res!875990) (not e!752973))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53065)

(declare-fun minValue!1279 () V!53065)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!88880 0))(
  ( (array!88881 (arr!42914 (Array (_ BitVec 32) (_ BitVec 64))) (size!43464 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88880)

(declare-datatypes ((tuple2!23250 0))(
  ( (tuple2!23251 (_1!11636 (_ BitVec 64)) (_2!11636 V!53065)) )
))
(declare-datatypes ((List!30402 0))(
  ( (Nil!30399) (Cons!30398 (h!31607 tuple2!23250) (t!44102 List!30402)) )
))
(declare-datatypes ((ListLongMap!20907 0))(
  ( (ListLongMap!20908 (toList!10469 List!30402)) )
))
(declare-fun contains!8624 (ListLongMap!20907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5477 (array!88880 array!88878 (_ BitVec 32) (_ BitVec 32) V!53065 V!53065 (_ BitVec 32) Int) ListLongMap!20907)

(assert (=> b!1319860 (= res!875990 (contains!8624 (getCurrentListMap!5477 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319861 () Bool)

(declare-fun res!875992 () Bool)

(assert (=> b!1319861 (=> (not res!875992) (not e!752973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88880 (_ BitVec 32)) Bool)

(assert (=> b!1319861 (= res!875992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319862 () Bool)

(declare-fun res!875995 () Bool)

(assert (=> b!1319862 (=> (not res!875995) (not e!752973))))

(assert (=> b!1319862 (= res!875995 (not (= (select (arr!42914 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319863 () Bool)

(assert (=> b!1319863 (= e!752973 (not true))))

(declare-fun lt!586754 () ListLongMap!20907)

(assert (=> b!1319863 (contains!8624 lt!586754 k!1164)))

(declare-datatypes ((Unit!43476 0))(
  ( (Unit!43477) )
))
(declare-fun lt!586752 () Unit!43476)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!124 ((_ BitVec 64) (_ BitVec 64) V!53065 ListLongMap!20907) Unit!43476)

(assert (=> b!1319863 (= lt!586752 (lemmaInListMapAfterAddingDiffThenInBefore!124 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586754))))

(declare-fun lt!586753 () ListLongMap!20907)

(assert (=> b!1319863 (contains!8624 lt!586753 k!1164)))

(declare-fun lt!586755 () Unit!43476)

(assert (=> b!1319863 (= lt!586755 (lemmaInListMapAfterAddingDiffThenInBefore!124 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586753))))

(declare-fun +!4528 (ListLongMap!20907 tuple2!23250) ListLongMap!20907)

(assert (=> b!1319863 (= lt!586753 (+!4528 lt!586754 (tuple2!23251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6163 (array!88880 array!88878 (_ BitVec 32) (_ BitVec 32) V!53065 V!53065 (_ BitVec 32) Int) ListLongMap!20907)

(declare-fun get!21570 (ValueCell!17087 V!53065) V!53065)

(declare-fun dynLambda!3467 (Int (_ BitVec 64)) V!53065)

(assert (=> b!1319863 (= lt!586754 (+!4528 (getCurrentListMapNoExtraKeys!6163 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23251 (select (arr!42914 _keys!1609) from!2000) (get!21570 (select (arr!42913 _values!1337) from!2000) (dynLambda!3467 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!875996 () Bool)

(assert (=> start!111494 (=> (not res!875996) (not e!752973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111494 (= res!875996 (validMask!0 mask!2019))))

(assert (=> start!111494 e!752973))

(declare-fun array_inv!32401 (array!88880) Bool)

(assert (=> start!111494 (array_inv!32401 _keys!1609)))

(assert (=> start!111494 true))

(declare-fun tp_is_empty!35971 () Bool)

(assert (=> start!111494 tp_is_empty!35971))

(declare-fun e!752970 () Bool)

(declare-fun array_inv!32402 (array!88878) Bool)

(assert (=> start!111494 (and (array_inv!32402 _values!1337) e!752970)))

(assert (=> start!111494 tp!105928))

(declare-fun b!1319864 () Bool)

(declare-fun res!875993 () Bool)

(assert (=> b!1319864 (=> (not res!875993) (not e!752973))))

(declare-datatypes ((List!30403 0))(
  ( (Nil!30400) (Cons!30399 (h!31608 (_ BitVec 64)) (t!44103 List!30403)) )
))
(declare-fun arrayNoDuplicates!0 (array!88880 (_ BitVec 32) List!30403) Bool)

(assert (=> b!1319864 (= res!875993 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30400))))

(declare-fun mapIsEmpty!55604 () Bool)

(assert (=> mapIsEmpty!55604 mapRes!55604))

(declare-fun b!1319865 () Bool)

(declare-fun res!875991 () Bool)

(assert (=> b!1319865 (=> (not res!875991) (not e!752973))))

(assert (=> b!1319865 (= res!875991 (and (= (size!43463 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43464 _keys!1609) (size!43463 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319866 () Bool)

(declare-fun e!752974 () Bool)

(assert (=> b!1319866 (= e!752970 (and e!752974 mapRes!55604))))

(declare-fun condMapEmpty!55604 () Bool)

(declare-fun mapDefault!55604 () ValueCell!17087)

