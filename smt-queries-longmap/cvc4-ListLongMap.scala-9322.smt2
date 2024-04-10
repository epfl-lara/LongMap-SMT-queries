; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111372 () Bool)

(assert start!111372)

(declare-fun b_free!30029 () Bool)

(declare-fun b_next!30029 () Bool)

(assert (=> start!111372 (= b_free!30029 (not b_next!30029))))

(declare-fun tp!105562 () Bool)

(declare-fun b_and!48249 () Bool)

(assert (=> start!111372 (= tp!105562 b_and!48249)))

(declare-fun mapNonEmpty!55421 () Bool)

(declare-fun mapRes!55421 () Bool)

(declare-fun tp!105563 () Bool)

(declare-fun e!752056 () Bool)

(assert (=> mapNonEmpty!55421 (= mapRes!55421 (and tp!105563 e!752056))))

(declare-datatypes ((V!52901 0))(
  ( (V!52902 (val!17999 Int)) )
))
(declare-datatypes ((ValueCell!17026 0))(
  ( (ValueCellFull!17026 (v!20629 V!52901)) (EmptyCell!17026) )
))
(declare-datatypes ((array!88650 0))(
  ( (array!88651 (arr!42799 (Array (_ BitVec 32) ValueCell!17026)) (size!43349 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88650)

(declare-fun mapValue!55421 () ValueCell!17026)

(declare-fun mapKey!55421 () (_ BitVec 32))

(declare-fun mapRest!55421 () (Array (_ BitVec 32) ValueCell!17026))

(assert (=> mapNonEmpty!55421 (= (arr!42799 _values!1337) (store mapRest!55421 mapKey!55421 mapValue!55421))))

(declare-fun b!1317868 () Bool)

(declare-fun res!874640 () Bool)

(declare-fun e!752058 () Bool)

(assert (=> b!1317868 (=> (not res!874640) (not e!752058))))

(declare-datatypes ((array!88652 0))(
  ( (array!88653 (arr!42800 (Array (_ BitVec 32) (_ BitVec 64))) (size!43350 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88652)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1317868 (= res!874640 (and (= (size!43349 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43350 _keys!1609) (size!43349 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317869 () Bool)

(declare-fun res!874638 () Bool)

(assert (=> b!1317869 (=> (not res!874638) (not e!752058))))

(declare-datatypes ((List!30324 0))(
  ( (Nil!30321) (Cons!30320 (h!31529 (_ BitVec 64)) (t!43932 List!30324)) )
))
(declare-fun arrayNoDuplicates!0 (array!88652 (_ BitVec 32) List!30324) Bool)

(assert (=> b!1317869 (= res!874638 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30321))))

(declare-fun b!1317870 () Bool)

(assert (=> b!1317870 (= e!752058 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun minValue!1279 () V!52901)

(declare-fun lt!586419 () Bool)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!52901)

(declare-datatypes ((tuple2!23166 0))(
  ( (tuple2!23167 (_1!11594 (_ BitVec 64)) (_2!11594 V!52901)) )
))
(declare-datatypes ((List!30325 0))(
  ( (Nil!30322) (Cons!30321 (h!31530 tuple2!23166) (t!43933 List!30325)) )
))
(declare-datatypes ((ListLongMap!20823 0))(
  ( (ListLongMap!20824 (toList!10427 List!30325)) )
))
(declare-fun contains!8582 (ListLongMap!20823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5440 (array!88652 array!88650 (_ BitVec 32) (_ BitVec 32) V!52901 V!52901 (_ BitVec 32) Int) ListLongMap!20823)

(assert (=> b!1317870 (= lt!586419 (contains!8582 (getCurrentListMap!5440 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!874639 () Bool)

(assert (=> start!111372 (=> (not res!874639) (not e!752058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111372 (= res!874639 (validMask!0 mask!2019))))

(assert (=> start!111372 e!752058))

(declare-fun array_inv!32323 (array!88652) Bool)

(assert (=> start!111372 (array_inv!32323 _keys!1609)))

(assert (=> start!111372 true))

(declare-fun tp_is_empty!35849 () Bool)

(assert (=> start!111372 tp_is_empty!35849))

(declare-fun e!752057 () Bool)

(declare-fun array_inv!32324 (array!88650) Bool)

(assert (=> start!111372 (and (array_inv!32324 _values!1337) e!752057)))

(assert (=> start!111372 tp!105562))

(declare-fun b!1317871 () Bool)

(assert (=> b!1317871 (= e!752056 tp_is_empty!35849)))

(declare-fun b!1317872 () Bool)

(declare-fun e!752055 () Bool)

(assert (=> b!1317872 (= e!752057 (and e!752055 mapRes!55421))))

(declare-fun condMapEmpty!55421 () Bool)

(declare-fun mapDefault!55421 () ValueCell!17026)

