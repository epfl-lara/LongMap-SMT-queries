; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111234 () Bool)

(assert start!111234)

(declare-fun b!1316753 () Bool)

(declare-fun e!751219 () Bool)

(declare-fun e!751218 () Bool)

(declare-fun mapRes!55259 () Bool)

(assert (=> b!1316753 (= e!751219 (and e!751218 mapRes!55259))))

(declare-fun condMapEmpty!55259 () Bool)

(declare-datatypes ((V!52769 0))(
  ( (V!52770 (val!17949 Int)) )
))
(declare-datatypes ((ValueCell!16976 0))(
  ( (ValueCellFull!16976 (v!20578 V!52769)) (EmptyCell!16976) )
))
(declare-datatypes ((array!88458 0))(
  ( (array!88459 (arr!42707 (Array (_ BitVec 32) ValueCell!16976)) (size!43257 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88458)

(declare-fun mapDefault!55259 () ValueCell!16976)

