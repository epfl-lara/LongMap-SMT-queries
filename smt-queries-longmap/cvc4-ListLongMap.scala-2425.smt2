; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38312 () Bool)

(assert start!38312)

(declare-fun b!395110 () Bool)

(declare-fun e!239229 () Bool)

(declare-fun e!239230 () Bool)

(declare-fun mapRes!16296 () Bool)

(assert (=> b!395110 (= e!239229 (and e!239230 mapRes!16296))))

(declare-fun condMapEmpty!16296 () Bool)

(declare-datatypes ((V!14159 0))(
  ( (V!14160 (val!4940 Int)) )
))
(declare-datatypes ((ValueCell!4552 0))(
  ( (ValueCellFull!4552 (v!7186 V!14159)) (EmptyCell!4552) )
))
(declare-datatypes ((array!23489 0))(
  ( (array!23490 (arr!11198 (Array (_ BitVec 32) ValueCell!4552)) (size!11550 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23489)

(declare-fun mapDefault!16296 () ValueCell!4552)

