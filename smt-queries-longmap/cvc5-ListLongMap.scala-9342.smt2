; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111488 () Bool)

(assert start!111488)

(declare-fun b_free!30145 () Bool)

(declare-fun b_next!30145 () Bool)

(assert (=> start!111488 (= b_free!30145 (not b_next!30145))))

(declare-fun tp!105911 () Bool)

(declare-fun b_and!48449 () Bool)

(assert (=> start!111488 (= tp!105911 b_and!48449)))

(declare-fun b!1319755 () Bool)

(declare-fun res!875919 () Bool)

(declare-fun e!752927 () Bool)

(assert (=> b!1319755 (=> (not res!875919) (not e!752927))))

(declare-datatypes ((array!88866 0))(
  ( (array!88867 (arr!42907 (Array (_ BitVec 32) (_ BitVec 64))) (size!43457 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88866)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88866 (_ BitVec 32)) Bool)

(assert (=> b!1319755 (= res!875919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319756 () Bool)

(declare-fun res!875920 () Bool)

(assert (=> b!1319756 (=> (not res!875920) (not e!752927))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53057 0))(
  ( (V!53058 (val!18057 Int)) )
))
(declare-fun zeroValue!1279 () V!53057)

(declare-datatypes ((ValueCell!17084 0))(
  ( (ValueCellFull!17084 (v!20687 V!53057)) (EmptyCell!17084) )
))
(declare-datatypes ((array!88868 0))(
  ( (array!88869 (arr!42908 (Array (_ BitVec 32) ValueCell!17084)) (size!43458 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88868)

(declare-fun minValue!1279 () V!53057)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23244 0))(
  ( (tuple2!23245 (_1!11633 (_ BitVec 64)) (_2!11633 V!53057)) )
))
(declare-datatypes ((List!30396 0))(
  ( (Nil!30393) (Cons!30392 (h!31601 tuple2!23244) (t!44090 List!30396)) )
))
(declare-datatypes ((ListLongMap!20901 0))(
  ( (ListLongMap!20902 (toList!10466 List!30396)) )
))
(declare-fun contains!8621 (ListLongMap!20901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5474 (array!88866 array!88868 (_ BitVec 32) (_ BitVec 32) V!53057 V!53057 (_ BitVec 32) Int) ListLongMap!20901)

(assert (=> b!1319756 (= res!875920 (contains!8621 (getCurrentListMap!5474 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319757 () Bool)

(declare-fun res!875922 () Bool)

(assert (=> b!1319757 (=> (not res!875922) (not e!752927))))

(declare-datatypes ((List!30397 0))(
  ( (Nil!30394) (Cons!30393 (h!31602 (_ BitVec 64)) (t!44091 List!30397)) )
))
(declare-fun arrayNoDuplicates!0 (array!88866 (_ BitVec 32) List!30397) Bool)

(assert (=> b!1319757 (= res!875922 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30394))))

(declare-fun b!1319758 () Bool)

(assert (=> b!1319758 (= e!752927 (not true))))

(declare-fun lt!586719 () ListLongMap!20901)

(assert (=> b!1319758 (contains!8621 lt!586719 k!1164)))

(declare-datatypes ((Unit!43470 0))(
  ( (Unit!43471) )
))
(declare-fun lt!586717 () Unit!43470)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!121 ((_ BitVec 64) (_ BitVec 64) V!53057 ListLongMap!20901) Unit!43470)

(assert (=> b!1319758 (= lt!586717 (lemmaInListMapAfterAddingDiffThenInBefore!121 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586719))))

(declare-fun lt!586718 () ListLongMap!20901)

(assert (=> b!1319758 (contains!8621 lt!586718 k!1164)))

(declare-fun lt!586716 () Unit!43470)

(assert (=> b!1319758 (= lt!586716 (lemmaInListMapAfterAddingDiffThenInBefore!121 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586718))))

(declare-fun +!4525 (ListLongMap!20901 tuple2!23244) ListLongMap!20901)

(assert (=> b!1319758 (= lt!586718 (+!4525 lt!586719 (tuple2!23245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6160 (array!88866 array!88868 (_ BitVec 32) (_ BitVec 32) V!53057 V!53057 (_ BitVec 32) Int) ListLongMap!20901)

(declare-fun get!21565 (ValueCell!17084 V!53057) V!53057)

(declare-fun dynLambda!3464 (Int (_ BitVec 64)) V!53057)

(assert (=> b!1319758 (= lt!586719 (+!4525 (getCurrentListMapNoExtraKeys!6160 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23245 (select (arr!42907 _keys!1609) from!2000) (get!21565 (select (arr!42908 _values!1337) from!2000) (dynLambda!3464 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1319759 () Bool)

(declare-fun e!752926 () Bool)

(declare-fun tp_is_empty!35965 () Bool)

(assert (=> b!1319759 (= e!752926 tp_is_empty!35965)))

(declare-fun b!1319760 () Bool)

(declare-fun res!875921 () Bool)

(assert (=> b!1319760 (=> (not res!875921) (not e!752927))))

(assert (=> b!1319760 (= res!875921 (and (= (size!43458 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43457 _keys!1609) (size!43458 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!875918 () Bool)

(assert (=> start!111488 (=> (not res!875918) (not e!752927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111488 (= res!875918 (validMask!0 mask!2019))))

(assert (=> start!111488 e!752927))

(declare-fun array_inv!32395 (array!88866) Bool)

(assert (=> start!111488 (array_inv!32395 _keys!1609)))

(assert (=> start!111488 true))

(assert (=> start!111488 tp_is_empty!35965))

(declare-fun e!752925 () Bool)

(declare-fun array_inv!32396 (array!88868) Bool)

(assert (=> start!111488 (and (array_inv!32396 _values!1337) e!752925)))

(assert (=> start!111488 tp!105911))

(declare-fun mapIsEmpty!55595 () Bool)

(declare-fun mapRes!55595 () Bool)

(assert (=> mapIsEmpty!55595 mapRes!55595))

(declare-fun b!1319761 () Bool)

(declare-fun e!752929 () Bool)

(assert (=> b!1319761 (= e!752929 tp_is_empty!35965)))

(declare-fun b!1319762 () Bool)

(declare-fun res!875923 () Bool)

(assert (=> b!1319762 (=> (not res!875923) (not e!752927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319762 (= res!875923 (validKeyInArray!0 (select (arr!42907 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55595 () Bool)

(declare-fun tp!105910 () Bool)

(assert (=> mapNonEmpty!55595 (= mapRes!55595 (and tp!105910 e!752926))))

(declare-fun mapKey!55595 () (_ BitVec 32))

(declare-fun mapRest!55595 () (Array (_ BitVec 32) ValueCell!17084))

(declare-fun mapValue!55595 () ValueCell!17084)

(assert (=> mapNonEmpty!55595 (= (arr!42908 _values!1337) (store mapRest!55595 mapKey!55595 mapValue!55595))))

(declare-fun b!1319763 () Bool)

(declare-fun res!875917 () Bool)

(assert (=> b!1319763 (=> (not res!875917) (not e!752927))))

(assert (=> b!1319763 (= res!875917 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43457 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319764 () Bool)

(declare-fun res!875924 () Bool)

(assert (=> b!1319764 (=> (not res!875924) (not e!752927))))

(assert (=> b!1319764 (= res!875924 (not (= (select (arr!42907 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319765 () Bool)

(assert (=> b!1319765 (= e!752925 (and e!752929 mapRes!55595))))

(declare-fun condMapEmpty!55595 () Bool)

(declare-fun mapDefault!55595 () ValueCell!17084)

