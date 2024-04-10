; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111456 () Bool)

(assert start!111456)

(declare-fun b_free!30113 () Bool)

(declare-fun b_next!30113 () Bool)

(assert (=> start!111456 (= b_free!30113 (not b_next!30113))))

(declare-fun tp!105814 () Bool)

(declare-fun b_and!48385 () Bool)

(assert (=> start!111456 (= tp!105814 b_and!48385)))

(declare-fun mapNonEmpty!55547 () Bool)

(declare-fun mapRes!55547 () Bool)

(declare-fun tp!105815 () Bool)

(declare-fun e!752689 () Bool)

(assert (=> mapNonEmpty!55547 (= mapRes!55547 (and tp!105815 e!752689))))

(declare-datatypes ((V!53013 0))(
  ( (V!53014 (val!18041 Int)) )
))
(declare-datatypes ((ValueCell!17068 0))(
  ( (ValueCellFull!17068 (v!20671 V!53013)) (EmptyCell!17068) )
))
(declare-fun mapValue!55547 () ValueCell!17068)

(declare-datatypes ((array!88804 0))(
  ( (array!88805 (arr!42876 (Array (_ BitVec 32) ValueCell!17068)) (size!43426 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88804)

(declare-fun mapKey!55547 () (_ BitVec 32))

(declare-fun mapRest!55547 () (Array (_ BitVec 32) ValueCell!17068))

(assert (=> mapNonEmpty!55547 (= (arr!42876 _values!1337) (store mapRest!55547 mapKey!55547 mapValue!55547))))

(declare-fun b!1319195 () Bool)

(declare-fun res!875534 () Bool)

(declare-fun e!752686 () Bool)

(assert (=> b!1319195 (=> (not res!875534) (not e!752686))))

(declare-datatypes ((array!88806 0))(
  ( (array!88807 (arr!42877 (Array (_ BitVec 32) (_ BitVec 64))) (size!43427 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88806)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319195 (= res!875534 (validKeyInArray!0 (select (arr!42877 _keys!1609) from!2000)))))

(declare-fun b!1319196 () Bool)

(declare-fun res!875538 () Bool)

(assert (=> b!1319196 (=> (not res!875538) (not e!752686))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88806 (_ BitVec 32)) Bool)

(assert (=> b!1319196 (= res!875538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319197 () Bool)

(declare-fun res!875536 () Bool)

(assert (=> b!1319197 (=> (not res!875536) (not e!752686))))

(declare-datatypes ((List!30370 0))(
  ( (Nil!30367) (Cons!30366 (h!31575 (_ BitVec 64)) (t!44032 List!30370)) )
))
(declare-fun arrayNoDuplicates!0 (array!88806 (_ BitVec 32) List!30370) Bool)

(assert (=> b!1319197 (= res!875536 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30367))))

(declare-fun res!875537 () Bool)

(assert (=> start!111456 (=> (not res!875537) (not e!752686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111456 (= res!875537 (validMask!0 mask!2019))))

(assert (=> start!111456 e!752686))

(declare-fun array_inv!32371 (array!88806) Bool)

(assert (=> start!111456 (array_inv!32371 _keys!1609)))

(assert (=> start!111456 true))

(declare-fun tp_is_empty!35933 () Bool)

(assert (=> start!111456 tp_is_empty!35933))

(declare-fun e!752687 () Bool)

(declare-fun array_inv!32372 (array!88804) Bool)

(assert (=> start!111456 (and (array_inv!32372 _values!1337) e!752687)))

(assert (=> start!111456 tp!105814))

(declare-fun b!1319198 () Bool)

(assert (=> b!1319198 (= e!752689 tp_is_empty!35933)))

(declare-fun b!1319199 () Bool)

(declare-fun res!875540 () Bool)

(assert (=> b!1319199 (=> (not res!875540) (not e!752686))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1319199 (= res!875540 (and (= (size!43426 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43427 _keys!1609) (size!43426 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319200 () Bool)

(declare-fun res!875533 () Bool)

(assert (=> b!1319200 (=> (not res!875533) (not e!752686))))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1319200 (= res!875533 (not (= (select (arr!42877 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319201 () Bool)

(declare-fun e!752685 () Bool)

(assert (=> b!1319201 (= e!752687 (and e!752685 mapRes!55547))))

(declare-fun condMapEmpty!55547 () Bool)

(declare-fun mapDefault!55547 () ValueCell!17068)

