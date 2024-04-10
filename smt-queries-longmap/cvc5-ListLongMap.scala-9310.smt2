; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111296 () Bool)

(assert start!111296)

(declare-fun b!1317105 () Bool)

(declare-fun e!751488 () Bool)

(declare-fun e!751487 () Bool)

(declare-fun mapRes!55307 () Bool)

(assert (=> b!1317105 (= e!751488 (and e!751487 mapRes!55307))))

(declare-fun condMapEmpty!55307 () Bool)

(declare-datatypes ((V!52801 0))(
  ( (V!52802 (val!17961 Int)) )
))
(declare-datatypes ((ValueCell!16988 0))(
  ( (ValueCellFull!16988 (v!20591 V!52801)) (EmptyCell!16988) )
))
(declare-datatypes ((array!88508 0))(
  ( (array!88509 (arr!42728 (Array (_ BitVec 32) ValueCell!16988)) (size!43278 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88508)

(declare-fun mapDefault!55307 () ValueCell!16988)

