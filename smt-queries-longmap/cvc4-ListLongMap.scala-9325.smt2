; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111390 () Bool)

(assert start!111390)

(declare-fun b_free!30047 () Bool)

(declare-fun b_next!30047 () Bool)

(assert (=> start!111390 (= b_free!30047 (not b_next!30047))))

(declare-fun tp!105617 () Bool)

(declare-fun b_and!48267 () Bool)

(assert (=> start!111390 (= tp!105617 b_and!48267)))

(declare-fun mapIsEmpty!55448 () Bool)

(declare-fun mapRes!55448 () Bool)

(assert (=> mapIsEmpty!55448 mapRes!55448))

(declare-fun b!1318084 () Bool)

(declare-fun e!752193 () Bool)

(declare-fun e!752191 () Bool)

(assert (=> b!1318084 (= e!752193 (and e!752191 mapRes!55448))))

(declare-fun condMapEmpty!55448 () Bool)

(declare-datatypes ((V!52925 0))(
  ( (V!52926 (val!18008 Int)) )
))
(declare-datatypes ((ValueCell!17035 0))(
  ( (ValueCellFull!17035 (v!20638 V!52925)) (EmptyCell!17035) )
))
(declare-datatypes ((array!88684 0))(
  ( (array!88685 (arr!42816 (Array (_ BitVec 32) ValueCell!17035)) (size!43366 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88684)

(declare-fun mapDefault!55448 () ValueCell!17035)

