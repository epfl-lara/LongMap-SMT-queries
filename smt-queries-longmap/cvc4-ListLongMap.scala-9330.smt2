; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111420 () Bool)

(assert start!111420)

(declare-fun b_free!30077 () Bool)

(declare-fun b_next!30077 () Bool)

(assert (=> start!111420 (= b_free!30077 (not b_next!30077))))

(declare-fun tp!105707 () Bool)

(declare-fun b_and!48313 () Bool)

(assert (=> start!111420 (= tp!105707 b_and!48313)))

(declare-fun b!1318565 () Bool)

(declare-fun res!875103 () Bool)

(declare-fun e!752416 () Bool)

(assert (=> b!1318565 (=> (not res!875103) (not e!752416))))

(declare-datatypes ((array!88738 0))(
  ( (array!88739 (arr!42843 (Array (_ BitVec 32) (_ BitVec 64))) (size!43393 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88738)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88738 (_ BitVec 32)) Bool)

(assert (=> b!1318565 (= res!875103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318566 () Bool)

(declare-fun res!875102 () Bool)

(assert (=> b!1318566 (=> (not res!875102) (not e!752416))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1318566 (= res!875102 (not (= (select (arr!42843 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1318567 () Bool)

(declare-fun res!875104 () Bool)

(assert (=> b!1318567 (=> (not res!875104) (not e!752416))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318567 (= res!875104 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43393 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318569 () Bool)

(declare-fun e!752415 () Bool)

(declare-fun e!752417 () Bool)

(declare-fun mapRes!55493 () Bool)

(assert (=> b!1318569 (= e!752415 (and e!752417 mapRes!55493))))

(declare-fun condMapEmpty!55493 () Bool)

(declare-datatypes ((V!52965 0))(
  ( (V!52966 (val!18023 Int)) )
))
(declare-datatypes ((ValueCell!17050 0))(
  ( (ValueCellFull!17050 (v!20653 V!52965)) (EmptyCell!17050) )
))
(declare-datatypes ((array!88740 0))(
  ( (array!88741 (arr!42844 (Array (_ BitVec 32) ValueCell!17050)) (size!43394 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88740)

(declare-fun mapDefault!55493 () ValueCell!17050)

