; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133438 () Bool)

(assert start!133438)

(declare-fun b!1559979 () Bool)

(declare-fun e!869238 () Bool)

(declare-fun e!869239 () Bool)

(declare-fun mapRes!59157 () Bool)

(assert (=> b!1559979 (= e!869238 (and e!869239 mapRes!59157))))

(declare-fun condMapEmpty!59157 () Bool)

(declare-datatypes ((V!59569 0))(
  ( (V!59570 (val!19344 Int)) )
))
(declare-datatypes ((ValueCell!18230 0))(
  ( (ValueCellFull!18230 (v!22096 V!59569)) (EmptyCell!18230) )
))
(declare-datatypes ((array!103768 0))(
  ( (array!103769 (arr!50076 (Array (_ BitVec 32) ValueCell!18230)) (size!50626 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103768)

(declare-fun mapDefault!59157 () ValueCell!18230)

