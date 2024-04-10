; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111408 () Bool)

(assert start!111408)

(declare-fun b_free!30065 () Bool)

(declare-fun b_next!30065 () Bool)

(assert (=> start!111408 (= b_free!30065 (not b_next!30065))))

(declare-fun tp!105670 () Bool)

(declare-fun b_and!48289 () Bool)

(assert (=> start!111408 (= tp!105670 b_and!48289)))

(declare-fun b!1318355 () Bool)

(declare-fun res!874958 () Bool)

(declare-fun e!752327 () Bool)

(assert (=> b!1318355 (=> (not res!874958) (not e!752327))))

(declare-datatypes ((array!88716 0))(
  ( (array!88717 (arr!42832 (Array (_ BitVec 32) (_ BitVec 64))) (size!43382 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88716)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318355 (= res!874958 (validKeyInArray!0 (select (arr!42832 _keys!1609) from!2000)))))

(declare-fun b!1318356 () Bool)

(declare-fun e!752326 () Bool)

(declare-fun e!752325 () Bool)

(declare-fun mapRes!55475 () Bool)

(assert (=> b!1318356 (= e!752326 (and e!752325 mapRes!55475))))

(declare-fun condMapEmpty!55475 () Bool)

(declare-datatypes ((V!52949 0))(
  ( (V!52950 (val!18017 Int)) )
))
(declare-datatypes ((ValueCell!17044 0))(
  ( (ValueCellFull!17044 (v!20647 V!52949)) (EmptyCell!17044) )
))
(declare-datatypes ((array!88718 0))(
  ( (array!88719 (arr!42833 (Array (_ BitVec 32) ValueCell!17044)) (size!43383 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88718)

(declare-fun mapDefault!55475 () ValueCell!17044)

