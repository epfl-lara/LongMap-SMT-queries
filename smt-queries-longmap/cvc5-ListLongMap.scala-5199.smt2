; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70208 () Bool)

(assert start!70208)

(declare-fun b_free!12601 () Bool)

(declare-fun b_next!12601 () Bool)

(assert (=> start!70208 (= b_free!12601 (not b_next!12601))))

(declare-fun tp!44524 () Bool)

(declare-fun b_and!21389 () Bool)

(assert (=> start!70208 (= tp!44524 b_and!21389)))

(declare-fun b!815655 () Bool)

(declare-fun e!452323 () Bool)

(declare-fun e!452320 () Bool)

(declare-fun mapRes!23053 () Bool)

(assert (=> b!815655 (= e!452323 (and e!452320 mapRes!23053))))

(declare-fun condMapEmpty!23053 () Bool)

(declare-datatypes ((V!24083 0))(
  ( (V!24084 (val!7203 Int)) )
))
(declare-datatypes ((ValueCell!6740 0))(
  ( (ValueCellFull!6740 (v!9630 V!24083)) (EmptyCell!6740) )
))
(declare-datatypes ((array!44824 0))(
  ( (array!44825 (arr!21470 (Array (_ BitVec 32) ValueCell!6740)) (size!21891 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44824)

(declare-fun mapDefault!23053 () ValueCell!6740)

