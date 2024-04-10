; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84188 () Bool)

(assert start!84188)

(declare-fun b_free!19889 () Bool)

(declare-fun b_next!19889 () Bool)

(assert (=> start!84188 (= b_free!19889 (not b_next!19889))))

(declare-fun tp!69271 () Bool)

(declare-fun b_and!31855 () Bool)

(assert (=> start!84188 (= tp!69271 b_and!31855)))

(declare-fun b!984597 () Bool)

(declare-fun e!555047 () Bool)

(declare-fun e!555044 () Bool)

(declare-fun mapRes!36515 () Bool)

(assert (=> b!984597 (= e!555047 (and e!555044 mapRes!36515))))

(declare-fun condMapEmpty!36515 () Bool)

(declare-datatypes ((V!35637 0))(
  ( (V!35638 (val!11546 Int)) )
))
(declare-datatypes ((ValueCell!11014 0))(
  ( (ValueCellFull!11014 (v!14108 V!35637)) (EmptyCell!11014) )
))
(declare-datatypes ((array!61963 0))(
  ( (array!61964 (arr!29839 (Array (_ BitVec 32) ValueCell!11014)) (size!30318 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61963)

(declare-fun mapDefault!36515 () ValueCell!11014)

