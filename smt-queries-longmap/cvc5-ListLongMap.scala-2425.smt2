; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38308 () Bool)

(assert start!38308)

(declare-fun b!395068 () Bool)

(declare-fun e!239198 () Bool)

(declare-fun e!239197 () Bool)

(declare-fun mapRes!16290 () Bool)

(assert (=> b!395068 (= e!239198 (and e!239197 mapRes!16290))))

(declare-fun condMapEmpty!16290 () Bool)

(declare-datatypes ((V!14155 0))(
  ( (V!14156 (val!4938 Int)) )
))
(declare-datatypes ((ValueCell!4550 0))(
  ( (ValueCellFull!4550 (v!7184 V!14155)) (EmptyCell!4550) )
))
(declare-datatypes ((array!23483 0))(
  ( (array!23484 (arr!11195 (Array (_ BitVec 32) ValueCell!4550)) (size!11547 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23483)

(declare-fun mapDefault!16290 () ValueCell!4550)

