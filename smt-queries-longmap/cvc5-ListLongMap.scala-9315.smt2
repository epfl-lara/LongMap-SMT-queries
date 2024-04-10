; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111326 () Bool)

(assert start!111326)

(declare-fun b!1317375 () Bool)

(declare-fun e!751712 () Bool)

(declare-fun tp_is_empty!35803 () Bool)

(assert (=> b!1317375 (= e!751712 tp_is_empty!35803)))

(declare-fun b!1317376 () Bool)

(declare-fun e!751710 () Bool)

(declare-fun mapRes!55352 () Bool)

(assert (=> b!1317376 (= e!751710 (and e!751712 mapRes!55352))))

(declare-fun condMapEmpty!55352 () Bool)

(declare-datatypes ((V!52841 0))(
  ( (V!52842 (val!17976 Int)) )
))
(declare-datatypes ((ValueCell!17003 0))(
  ( (ValueCellFull!17003 (v!20606 V!52841)) (EmptyCell!17003) )
))
(declare-datatypes ((array!88564 0))(
  ( (array!88565 (arr!42756 (Array (_ BitVec 32) ValueCell!17003)) (size!43306 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88564)

(declare-fun mapDefault!55352 () ValueCell!17003)

