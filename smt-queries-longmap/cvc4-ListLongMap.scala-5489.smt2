; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72722 () Bool)

(assert start!72722)

(declare-fun b!844046 () Bool)

(declare-fun e!471035 () Bool)

(declare-fun e!471037 () Bool)

(declare-fun mapRes!25259 () Bool)

(assert (=> b!844046 (= e!471035 (and e!471037 mapRes!25259))))

(declare-fun condMapEmpty!25259 () Bool)

(declare-datatypes ((V!26077 0))(
  ( (V!26078 (val!7934 Int)) )
))
(declare-datatypes ((ValueCell!7447 0))(
  ( (ValueCellFull!7447 (v!10359 V!26077)) (EmptyCell!7447) )
))
(declare-datatypes ((array!47788 0))(
  ( (array!47789 (arr!22925 (Array (_ BitVec 32) ValueCell!7447)) (size!23365 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47788)

(declare-fun mapDefault!25259 () ValueCell!7447)

