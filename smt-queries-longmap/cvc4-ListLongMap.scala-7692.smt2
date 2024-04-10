; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96554 () Bool)

(assert start!96554)

(declare-fun b_free!23081 () Bool)

(declare-fun b_next!23081 () Bool)

(assert (=> start!96554 (= b_free!23081 (not b_next!23081))))

(declare-fun tp!81175 () Bool)

(declare-fun b_and!36853 () Bool)

(assert (=> start!96554 (= tp!81175 b_and!36853)))

(declare-fun b!1098060 () Bool)

(declare-fun e!626722 () Bool)

(declare-fun e!626720 () Bool)

(declare-fun mapRes!42463 () Bool)

(assert (=> b!1098060 (= e!626722 (and e!626720 mapRes!42463))))

(declare-fun condMapEmpty!42463 () Bool)

(declare-datatypes ((V!41301 0))(
  ( (V!41302 (val!13622 Int)) )
))
(declare-datatypes ((ValueCell!12856 0))(
  ( (ValueCellFull!12856 (v!16245 V!41301)) (EmptyCell!12856) )
))
(declare-datatypes ((array!71175 0))(
  ( (array!71176 (arr!34257 (Array (_ BitVec 32) ValueCell!12856)) (size!34793 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71175)

(declare-fun mapDefault!42463 () ValueCell!12856)

