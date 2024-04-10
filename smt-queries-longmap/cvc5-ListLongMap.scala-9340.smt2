; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111476 () Bool)

(assert start!111476)

(declare-fun b_free!30133 () Bool)

(declare-fun b_next!30133 () Bool)

(assert (=> start!111476 (= b_free!30133 (not b_next!30133))))

(declare-fun tp!105875 () Bool)

(declare-fun b_and!48425 () Bool)

(assert (=> start!111476 (= tp!105875 b_and!48425)))

(declare-fun b!1319545 () Bool)

(declare-fun res!875776 () Bool)

(declare-fun e!752839 () Bool)

(assert (=> b!1319545 (=> (not res!875776) (not e!752839))))

(declare-datatypes ((array!88844 0))(
  ( (array!88845 (arr!42896 (Array (_ BitVec 32) (_ BitVec 64))) (size!43446 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88844)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88844 (_ BitVec 32)) Bool)

(assert (=> b!1319545 (= res!875776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319546 () Bool)

(declare-fun e!752838 () Bool)

(declare-fun tp_is_empty!35953 () Bool)

(assert (=> b!1319546 (= e!752838 tp_is_empty!35953)))

(declare-fun b!1319547 () Bool)

(declare-fun res!875778 () Bool)

(assert (=> b!1319547 (=> (not res!875778) (not e!752839))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1319547 (= res!875778 (not (= (select (arr!42896 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319548 () Bool)

(declare-fun e!752835 () Bool)

(assert (=> b!1319548 (= e!752835 tp_is_empty!35953)))

(declare-fun b!1319549 () Bool)

(assert (=> b!1319549 (= e!752839 (not true))))

(declare-datatypes ((V!53041 0))(
  ( (V!53042 (val!18051 Int)) )
))
(declare-datatypes ((tuple2!23234 0))(
  ( (tuple2!23235 (_1!11628 (_ BitVec 64)) (_2!11628 V!53041)) )
))
(declare-datatypes ((List!30387 0))(
  ( (Nil!30384) (Cons!30383 (h!31592 tuple2!23234) (t!44069 List!30387)) )
))
(declare-datatypes ((ListLongMap!20891 0))(
  ( (ListLongMap!20892 (toList!10461 List!30387)) )
))
(declare-fun lt!586659 () ListLongMap!20891)

(declare-fun contains!8616 (ListLongMap!20891 (_ BitVec 64)) Bool)

(assert (=> b!1319549 (contains!8616 lt!586659 k!1164)))

(declare-datatypes ((Unit!43460 0))(
  ( (Unit!43461) )
))
(declare-fun lt!586658 () Unit!43460)

(declare-fun minValue!1279 () V!53041)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!116 ((_ BitVec 64) (_ BitVec 64) V!53041 ListLongMap!20891) Unit!43460)

(assert (=> b!1319549 (= lt!586658 (lemmaInListMapAfterAddingDiffThenInBefore!116 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586659))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53041)

(declare-datatypes ((ValueCell!17078 0))(
  ( (ValueCellFull!17078 (v!20681 V!53041)) (EmptyCell!17078) )
))
(declare-datatypes ((array!88846 0))(
  ( (array!88847 (arr!42897 (Array (_ BitVec 32) ValueCell!17078)) (size!43447 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88846)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4520 (ListLongMap!20891 tuple2!23234) ListLongMap!20891)

(declare-fun getCurrentListMapNoExtraKeys!6155 (array!88844 array!88846 (_ BitVec 32) (_ BitVec 32) V!53041 V!53041 (_ BitVec 32) Int) ListLongMap!20891)

(declare-fun get!21556 (ValueCell!17078 V!53041) V!53041)

(declare-fun dynLambda!3459 (Int (_ BitVec 64)) V!53041)

(assert (=> b!1319549 (= lt!586659 (+!4520 (+!4520 (getCurrentListMapNoExtraKeys!6155 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23235 (select (arr!42896 _keys!1609) from!2000) (get!21556 (select (arr!42897 _values!1337) from!2000) (dynLambda!3459 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!55577 () Bool)

(declare-fun mapRes!55577 () Bool)

(declare-fun tp!105874 () Bool)

(assert (=> mapNonEmpty!55577 (= mapRes!55577 (and tp!105874 e!752835))))

(declare-fun mapKey!55577 () (_ BitVec 32))

(declare-fun mapRest!55577 () (Array (_ BitVec 32) ValueCell!17078))

(declare-fun mapValue!55577 () ValueCell!17078)

(assert (=> mapNonEmpty!55577 (= (arr!42897 _values!1337) (store mapRest!55577 mapKey!55577 mapValue!55577))))

(declare-fun b!1319551 () Bool)

(declare-fun res!875780 () Bool)

(assert (=> b!1319551 (=> (not res!875780) (not e!752839))))

(assert (=> b!1319551 (= res!875780 (and (= (size!43447 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43446 _keys!1609) (size!43447 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319552 () Bool)

(declare-fun res!875777 () Bool)

(assert (=> b!1319552 (=> (not res!875777) (not e!752839))))

(declare-datatypes ((List!30388 0))(
  ( (Nil!30385) (Cons!30384 (h!31593 (_ BitVec 64)) (t!44070 List!30388)) )
))
(declare-fun arrayNoDuplicates!0 (array!88844 (_ BitVec 32) List!30388) Bool)

(assert (=> b!1319552 (= res!875777 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30385))))

(declare-fun b!1319553 () Bool)

(declare-fun res!875775 () Bool)

(assert (=> b!1319553 (=> (not res!875775) (not e!752839))))

(declare-fun getCurrentListMap!5470 (array!88844 array!88846 (_ BitVec 32) (_ BitVec 32) V!53041 V!53041 (_ BitVec 32) Int) ListLongMap!20891)

(assert (=> b!1319553 (= res!875775 (contains!8616 (getCurrentListMap!5470 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapIsEmpty!55577 () Bool)

(assert (=> mapIsEmpty!55577 mapRes!55577))

(declare-fun b!1319550 () Bool)

(declare-fun res!875779 () Bool)

(assert (=> b!1319550 (=> (not res!875779) (not e!752839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319550 (= res!875779 (validKeyInArray!0 (select (arr!42896 _keys!1609) from!2000)))))

(declare-fun res!875773 () Bool)

(assert (=> start!111476 (=> (not res!875773) (not e!752839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111476 (= res!875773 (validMask!0 mask!2019))))

(assert (=> start!111476 e!752839))

(declare-fun array_inv!32385 (array!88844) Bool)

(assert (=> start!111476 (array_inv!32385 _keys!1609)))

(assert (=> start!111476 true))

(assert (=> start!111476 tp_is_empty!35953))

(declare-fun e!752836 () Bool)

(declare-fun array_inv!32386 (array!88846) Bool)

(assert (=> start!111476 (and (array_inv!32386 _values!1337) e!752836)))

(assert (=> start!111476 tp!105875))

(declare-fun b!1319554 () Bool)

(assert (=> b!1319554 (= e!752836 (and e!752838 mapRes!55577))))

(declare-fun condMapEmpty!55577 () Bool)

(declare-fun mapDefault!55577 () ValueCell!17078)

