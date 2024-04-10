; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97190 () Bool)

(assert start!97190)

(declare-fun b!1105719 () Bool)

(declare-fun e!631047 () Bool)

(declare-fun e!631046 () Bool)

(declare-fun mapRes!42949 () Bool)

(assert (=> b!1105719 (= e!631047 (and e!631046 mapRes!42949))))

(declare-fun condMapEmpty!42949 () Bool)

(declare-datatypes ((V!41689 0))(
  ( (V!41690 (val!13767 Int)) )
))
(declare-datatypes ((ValueCell!13001 0))(
  ( (ValueCellFull!13001 (v!16400 V!41689)) (EmptyCell!13001) )
))
(declare-datatypes ((array!71761 0))(
  ( (array!71762 (arr!34533 (Array (_ BitVec 32) ValueCell!13001)) (size!35069 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71761)

(declare-fun mapDefault!42949 () ValueCell!13001)

