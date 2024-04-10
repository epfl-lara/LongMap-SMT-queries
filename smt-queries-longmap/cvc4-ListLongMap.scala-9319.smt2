; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111354 () Bool)

(assert start!111354)

(declare-fun b_free!30011 () Bool)

(declare-fun b_next!30011 () Bool)

(assert (=> start!111354 (= b_free!30011 (not b_next!30011))))

(declare-fun tp!105508 () Bool)

(declare-fun b_and!48231 () Bool)

(assert (=> start!111354 (= tp!105508 b_and!48231)))

(declare-fun b!1317652 () Bool)

(declare-fun e!751924 () Bool)

(declare-fun e!751923 () Bool)

(declare-fun mapRes!55394 () Bool)

(assert (=> b!1317652 (= e!751924 (and e!751923 mapRes!55394))))

(declare-fun condMapEmpty!55394 () Bool)

(declare-datatypes ((V!52877 0))(
  ( (V!52878 (val!17990 Int)) )
))
(declare-datatypes ((ValueCell!17017 0))(
  ( (ValueCellFull!17017 (v!20620 V!52877)) (EmptyCell!17017) )
))
(declare-datatypes ((array!88616 0))(
  ( (array!88617 (arr!42782 (Array (_ BitVec 32) ValueCell!17017)) (size!43332 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88616)

(declare-fun mapDefault!55394 () ValueCell!17017)

