; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72784 () Bool)

(assert start!72784)

(declare-fun b!844697 () Bool)

(declare-fun e!471502 () Bool)

(declare-fun e!471501 () Bool)

(declare-fun mapRes!25352 () Bool)

(assert (=> b!844697 (= e!471502 (and e!471501 mapRes!25352))))

(declare-fun condMapEmpty!25352 () Bool)

(declare-datatypes ((V!26161 0))(
  ( (V!26162 (val!7965 Int)) )
))
(declare-datatypes ((ValueCell!7478 0))(
  ( (ValueCellFull!7478 (v!10390 V!26161)) (EmptyCell!7478) )
))
(declare-datatypes ((array!47898 0))(
  ( (array!47899 (arr!22980 (Array (_ BitVec 32) ValueCell!7478)) (size!23420 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47898)

(declare-fun mapDefault!25352 () ValueCell!7478)

